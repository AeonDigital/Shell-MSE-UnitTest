#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Checks whether the value contained in the control variables are NOT
# identical strings.
#
# @controlVariables
# - testResult
# - testExpected
mse_utest_assert_not_equals() {
  if [ "${MSE_UTEST_STOP_TESTS}" == "0" ]; then
    ((mseCountAssert=mseCountAssert+1))
    ((mseInnerCountTest=mseInnerCountTest+1))

    if [ $(mse_utest_is_not_equals "${testResult}" "${testExpected}") == "1" ]; then
      ((testCountSuccess=testCountSuccess+1))
      mse_utest_message_set "${mseInnerCountTest} ${lbl_assertResult_Ok}" "1"
      mse_utest_message_show
    else
      ((testCountFailed=testCountFailed+1))

      mse_utest_message_set "${mseInnerCountTest} ${lbl_assertResult_Fail}" "1"
      mse_utest_message_set "${lbl_assertResult_Result} ${testResult}"
      mse_utest_message_set "${lbl_assertResult_Expect} ${testExpected}"
      mse_utest_message_show

      if [ "${MSE_UTEST_STOP_ON_FIRST_FAIL}" == "1" ]; then
        MSE_UTEST_STOP_TESTS="1"
        echo -e "\n\n${MSE_UTEST_LOG_MESSAGES_INDENT}:: STOPED ON FIRST FAIL ::"
      fi
    fi
  fi
}
