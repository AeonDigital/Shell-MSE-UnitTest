#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Verifica se o valor de 'testResult' e 'testExpected' são iguais.
mse_utest_assertEqual() {
  ((mseCountAssert=mseCountAssert+1))
  ((mseInnerCountTest=mseInnerCountTest+1))

  if [ "$testResult" == "$testExpected" ]; then
    ((testCountSuccess=testCountSuccess+1))
    mse_utest_messageSet "${mseInnerCountTest} Ok" 1
    mse_utest_messageShow
  else
    ((testCountFailed=testCountFailed+1))
    mse_utest_messageSet "${mseInnerCountTest} FAIL" 1
    mse_utest_messageSet "Result    : ${testResult}"
    mse_utest_messageSet "Expected  : ${testExpected}"
    mse_utest_messageShow
  fi
}
