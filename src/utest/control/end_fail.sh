#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Prints the failure message related to the same on the screen.
#
# @return string
mse_utest_control_end_fail() {
  ((testCountFailed = testCountFailed + 1))

  mse_utest_message_set "${mseInnerCountTest} ${lbl_assertResult_Fail}" "1"
  mse_utest_message_set "${lbl_assertResult_Result} ${testResult}"
  mse_utest_message_set "${lbl_assertResult_Expect} ${testExpected}"
  mse_utest_message_show

  if [ "${MSE_UTEST_STOP_ON_FIRST_FAIL}" == "1" ]; then
    MSE_UTEST_STOP_TESTS="1"
    echo -e "\n\n${MSE_UTEST_LOG_MESSAGES_INDENT}${lbl_assertResult_StopInFirstFail}"
  fi
}