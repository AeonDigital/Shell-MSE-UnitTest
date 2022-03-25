#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_utest_messageShow() {
  #
  MSE_MD_UTEST_LOG_MESSAGES=()
  testResult=$(mse_utest_messageShow)
  testExpected=$(printf "${MSE_MD_UTEST_LOG_MESSAGES_INDENT}ERROR (in mse_utest_messageShow) : empty array MSE_MD_UTEST_LOG_MESSAGES")

  mse_utest_assertEqual



  #
  mse_utest_messageSet "item 1"
  testResult=$(mse_utest_messageShow)
  testExpected=$(printf "${MSE_MD_UTEST_LOG_MESSAGES_INDENT}item 1")

  mse_utest_assertEqual
}
