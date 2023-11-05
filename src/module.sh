#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Starts this MSE module.
# chmod +x src/module.sh
# ./src/module.sh
#
# Execute autotests
# ./src/module.sh autotest
. "${BASH_SOURCE%/*}/mseLoader.sh"



#
# Runs the battery of defined unit tests.
#
# @param string $1
# Name of function that will be tested singly.
#
# @param bool $2
# Stop tests on the first fail.
mse_utest_execute() {
  checkUTestDataBeforeExecute
  if [ "$?" == "0" ]; then
    loadUtestDependencies

    local mseTestFunction="${1}"

    local mseCountTests="0"
    local mseCountAssert="0"

    local testCountSuccess="0"
    local testCountFailed="0"

    local mseIterator
    local mseFunctionName


    for mseIterator in "${MSE_UTEST_PATH_TO_DEPENDENCIES[@]}"; do
      . "${mseIterator}"
    done

    for mseIterator in "${MSE_UTEST_FUNCTIONS_TO_SRC[@]}"; do
      . "${mseIterator}"
    done

    for mseIterator in "${MSE_UTEST_FUNCTIONS_TO_TEST[@]}"; do
      . "${mseIterator}"
    done


    mse_utest_message_set "${lbl_execute_startUnitTests}" "1"
    mse_utest_message_show


    MSE_UTEST_STOP_TESTS="0"
    MSE_UTEST_STOP_ON_FIRST_FAIL="0"
    if [ "${2}" == "1" ]; then
      MSE_UTEST_STOP_ON_FIRST_FAIL="1"
    fi


    IFS=$'\n'
    local mseFunctionsInAscOrder=($(sort <<< "${!MSE_UTEST_FUNCTIONS_TO_TEST[@]}"))
    unset IFS


    for mseFunctionName in "${mseFunctionsInAscOrder[@]}"; do
      if ([ "${mseTestFunction}" == "" ] || [ "${mseTestFunction}" == "${mseFunctionName}" ]) && [ "${MSE_UTEST_STOP_TESTS}" == "0" ]; then
        local mseTestFullFileName="test_${mseFunctionName}"

        local testResult=""
        local testExpected=""
        local mseInnerCountTest="0"

        ((mseCountTests = mseCountTests + 1))

        mse_utest_message_set "" "1"
        mse_utest_message_set "::"
        mse_utest_message_set ":: ${mseFunctionName}"
        mse_utest_message_show

        ${mseTestFullFileName}
      fi
    done


    mse_utest_message_set "" "1"
    mse_utest_message_set "${lbl_execute_results}"
    mse_utest_message_set "${lbl_execute_results_count_scri} ${mseCountTests}"
    mse_utest_message_set "${lbl_execute_results_count_test} ${mseCountAssert}"
    mse_utest_message_set "${lbl_execute_results_count_succ} ${testCountSuccess}"
    mse_utest_message_set "${lbl_execute_results_count_fail} ${testCountFailed}"
    mse_utest_message_set ""
    mse_utest_message_show
  fi
}





#
# Autotest for this module
mse_utest_autotest() {
  local mseDir=$(getRealPathToCurrentDirectory)

  #
  # Changing the "LC_CTYPE" variable below changes how character counts are done in a string.
  # - Use "" to count the number of chars in a string (multibyte safe)
  # - Use "C" to consider each byte in the string as an independent char.
  local oLC_CTYPE="${LC_CTYPE}"
  LC_CTYPE=""

  . "${mseDir}/autotest/src.sh"
  autotest_reset_control_data

  autotest_mse_utest_assert_equals
  autotest_mse_utest_assert_not_equals
  autotest_mse_utest_compare_string
  autotest_mse_utest_compare_array
  autotest_mse_utest_assert_string
  autotest_mse_utest_assert_array
  autotest_mse_utest_assert_string_multiline

  mse_utest_execute "${1}" "${2}"

  LC_CTYPE="${oLC_CTYPE}"
}



if [ "${1}" == "autotest" ]; then
  mse_utest_autotest "${2}" "${3}"
fi