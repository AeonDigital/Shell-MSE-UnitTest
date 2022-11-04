#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Verifica se o valor de 'testResult' e 'testExpected' são iguais.
mse_utest_assertEqual() {
  ((mseCountAssert=mseCountAssert+1))
  ((mseInnerCountTest=mseInnerCountTest+1))

  if [ "$testResult" == "$testExpected" ]; then
    ((testCountSuccess=testCountSuccess+1))
    mse_utest_messageSet "${mseInnerCountTest} ${lbl_assertResult_Ok}" 1
    mse_utest_messageShow
  else
    ((testCountFailed=testCountFailed+1))
    mse_utest_messageSet "${mseInnerCountTest} ${lbl_assertResult_Fail}" 1
    mse_utest_messageSet "${lbl_assertResult_Result} ${testResult}"
    mse_utest_messageSet "${lbl_assertResult_Expect} ${testExpected}"
    mse_utest_messageShow
  fi
}
