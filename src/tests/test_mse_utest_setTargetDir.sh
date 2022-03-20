#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_utest_setTargetDir() {
  #
  MSE_MD_UTEST_LOG_MESSAGES=()
  testResult=$(mse_utest_setTargetDir)
  testExpected=$(printf "${MSE_MD_UTEST_LOG_MESSAGES_INDENT}${MSE_MD_UTEST_LOG_MESSAGES_INDENT}ERROR (in mse_utest_setTargetDir) : lost argument")

  mse_utest_assertEqual



  #
  testResult=$(mse_utest_setTargetDir "nonexist-dir")
  local tmpExpected
  tmpExpected+="${MSE_MD_UTEST_LOG_MESSAGES_INDENT}\n"
  tmpExpected+="${MSE_MD_UTEST_LOG_MESSAGES_INDENT}Attention\n"
  tmpExpected+="${MSE_MD_UTEST_LOG_MESSAGES_INDENT}The specified directory does not exist.\n"
  tmpExpected+="${MSE_MD_UTEST_LOG_MESSAGES_INDENT}[[DIR]]\n"
  testExpected=$(mse_mod_replacePlaceHolder "DIR" "nonexist-dir" "${tmpExpected}")

  mse_utest_assertEqual
}
