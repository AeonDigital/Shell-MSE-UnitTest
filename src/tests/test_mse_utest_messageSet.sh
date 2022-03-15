#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_utest_messageSet() {
  #
  testResult=$(mse_utest_messageSet)
  testExpected=$(echo "${MSE_MD_UTEST_LOG_MESSAGES_INDENT}${MSE_MD_UTEST_LOG_MESSAGES_INDENT}ERROR (in mse_utest_messageSet) : expected 1 or 2 arguments")

  mse_utest_assertEqual



  #
  MSE_MD_UTEST_LOG_MESSAGES=()
  testResult=$(echo ${#MSE_MD_UTEST_LOG_MESSAGES[@]})
  testExpected=$(echo "0")

  mse_utest_assertEqual



  #
  mse_utest_messageSet "item 1"
  testResult=$(echo ${#MSE_MD_UTEST_LOG_MESSAGES[@]})
  testExpected=$(echo "1")

  mse_utest_assertEqual



  #
  mse_utest_messageSet "item 1"
  mse_utest_messageSet "item 2"
  testResult=$(echo ${#MSE_MD_UTEST_LOG_MESSAGES[@]})
  testExpected=$(echo "2")

  mse_utest_assertEqual



  #
  mse_utest_messageSet "nova mensagem" 1
  testResult=$(echo ${#MSE_MD_UTEST_LOG_MESSAGES[@]})
  testExpected=$(echo "1")

  mse_utest_assertEqual
}
