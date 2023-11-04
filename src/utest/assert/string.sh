#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Performs the exact comparison of control variables
# 'testResult' and 'testExpected'.
mse_utest_assert_string() {
  if [ "${MSE_UTEST_STOP_TESTS}" == "0" ]; then
    ((mseCountAssert=mseCountAssert+1))
    ((mseInnerCountTest=mseInnerCountTest+1))

    if [ "${testResult}" == "${testExpected}" ]; then
      ((testCountSuccess=testCountSuccess+1))
      mse_utest_message_set "${mseInnerCountTest} ${lbl_assertResult_Ok}" "1"
      mse_utest_message_show
    else
      ((testCountFailed=testCountFailed+1))
      local mseCompareStrings=$(mse_utest_compare_strings "${testResult}" "${testExpected}" "${lbl_assertResult_Indent}" "${lbl_assertResult_IndentAnotherLines}")

      mse_utest_message_set "${mseInnerCountTest} ${lbl_assertResult_Fail}" "1"
      mse_utest_message_set "${lbl_assertResult_Result} ${testResult}"
      mse_utest_message_set "${mseCompareStrings}"
      mse_utest_message_set "${lbl_assertResult_Expect} ${testExpected}"
      mse_utest_message_show

      if [ "${MSE_UTEST_STOP_ON_FIRST_FAIL}" == "1" ]; then
        MSE_UTEST_STOP_TESTS="1"
        echo -e "\n\n${MSE_UTEST_LOG_MESSAGES_INDENT}:: STOPED ON FIRST FAIL ::"
      fi
    fi
  fi
}