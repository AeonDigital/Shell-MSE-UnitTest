#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Prints the failure message related to the same on the screen.
#
# @param string $1
# Optional
# Value thats will replace the original 'testResult'.
#
# @param string $2
# Optional
# Value thats will replace the original 'testExpected'.
#
# @return string
mse_utest_control_end_fail() {
  ((testCountFailed = testCountFailed + 1))

  local mseUseResult="${testResult}"
  local mseUseExpected="${testExpected}"

  if [ "${1}" != "" ] && [ "${1}" != "${testResult}" ]; then
    mseUseResult="${1}"
  fi
  if [ "${2}" != "" ] && [ "${2}" != "${testExpected}" ]; then
    mseUseExpected="${2}"
  fi


  mse_utest_message_set "${mseInnerCountTest} ${lbl_assertResult_Fail}" "1"
  mse_utest_message_set "${lbl_assertResult_Result} ${mseUseResult}"
  mse_utest_message_set "${lbl_assertResult_Expect} ${mseUseExpected}"
  mse_utest_message_show

  if [ "${MSE_UTEST_STOP_ON_FIRST_FAIL}" == "1" ]; then
    MSE_UTEST_STOP_TESTS="1"
    echo -e "\n\n${MSE_UTEST_LOG_MESSAGES_INDENT}${lbl_assertResult_StopInFirstFail}"
  fi
}