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
# Performs a series of checks to ensure that the tests are working correctly.
mse_utest_checkDependenciesBeforeExecute() {
  local mseReturn="0"
  local mseMsg=""


  if [ "${#MSE_UTEST_FUNCTIONS_TO_SRC[@]}" == "0" ]; then
    mseReturn="1"
    mse_utest_message_set "${lbl_check_functionsScriptsNotDefined}" "1"
  else
    if [ "${#MSE_UTEST_FUNCTIONS_TO_TEST[@]}" == "0" ]; then
      mseReturn="1"
      mse_utest_message_set "${lbl_check_testScriptNotDefined}" "1"
    else

      if [ "${#MSE_UTEST_FUNCTIONS_TO_SRC[@]}" != "${#MSE_UTEST_FUNCTIONS_TO_TEST[@]}" ]; then
        mseReturn="1"
        mse_utest_message_set "${lbl_check_testsAndFunctionsCountDoesNotMatch}" "1"
      else
        local mseFunctionName

        for mseFunctionName in "${!MSE_UTEST_FUNCTIONS_TO_TEST[@]}"; do
          if [ "${mseReturn}" == "0" ]; then
            if [ -z "${MSE_UTEST_FUNCTIONS_TO_SRC[$mseFunctionName]+x}" ]; then
              mseReturn="1"

              mseMsg="${lbl_check_testWithoutFunction/\[\[FUNCTION\]\]/${mseFunctionName}}"
              mse_utest_message_set "${mseMsg}" "1"
            else
              if [ ! -f "${MSE_UTEST_FUNCTIONS_TO_TEST[${mseFunctionName}]}" ]; then
                mseReturn="1"

                mseMsg="${lbl_check_fileDoesNotExists/\[\[FILE\]\]/${MSE_UTEST_FUNCTIONS_TO_TEST[${mseFunctionName}]}}"
                mse_utest_message_set "${mseMsg}" "1"
              else
                if [ ! -f "${MSE_UTEST_FUNCTIONS_TO_SRC[${mseFunctionName}]}" ]; then
                  mseReturn="1"

                  mseMsg="${lbl_check_fileDoesNotExists/\[\[FILE\]\]/${MSE_UTEST_FUNCTIONS_TO_SRC[${mseFunctionName}]}}"
                  mse_utest_message_set "${mseMsg}" "1"
                fi
              fi
            fi
          fi
        done
      fi
    fi
  fi



  if [ "${#MSE_UTEST_LOG_MESSAGES[@]}" != "0" ]; then
    mse_utest_message_show
  fi

  return ${mseReturn}
}





#
# Runs the battery of defined unit tests.
#
# @param string $1
# Name of function that will be tested singly.
#
# @param bool $2
# Stop tests on the first fail.
mse_utest_execute() {
  mse_utest_checkDependenciesBeforeExecute
  if [ "$?" == "0" ]; then
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
  # Load minimal dependencies
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/functions/str/trim.sh"
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/functions/str/pad.sh"
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/functions/array/print/sort.sh"

  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/message/set.sh"
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/message/show.sh"

  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/control/can_assert.sh"
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/control/end_fail.sh"
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/control/end_success.sh"
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/control/start.sh"


  # Basic assertations
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/is/equals.sh"
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/is/not_equals.sh"

  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/assert/equals.sh"
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/assert/not_equals.sh"


  # Compare functions
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/compare/string.sh"
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/compare/array.sh"


  # Assert functions
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/assert/string.sh"
  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/assert/array.sh"



  #
  # Changing the "LC_CTYPE" variable below changes how character counts are done in a string.
  # - Use "" to count the number of chars in a string (multibyte safe)
  # - Use "C" to consider each byte in the string as an independent char.
  local oLC_CTYPE="${LC_CTYPE}"
  LC_CTYPE=""

  . "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/autotest/src.sh"

  LC_CTYPE="${oLC_CTYPE}"
}



if [ "${1}" == "autotest" ]; then
  mse_utest_autotest
fi