#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# Teste
test_mse_utest_setTargetDir() {
  #
  MSE_MD_UTEST_LOG_MESSAGES=()
  testResult=$(mse_utest_setTargetDir)
  testExpected=$(echo "${MSE_MD_UTEST_LOG_MESSAGES_INDENT}${MSE_MD_UTEST_LOG_MESSAGES_INDENT}ERROR (in mse_utest_setTargetDir) : expected 1 argument")

  mse_utest_assertEqual



  #
  testResult=$(mse_utest_setTargetDir "nonexist-dir")
  local tmpExpected=()
  tmpExpected[0]="${MSE_MD_UTEST_LOG_MESSAGES_INDENT}\n"
  tmpExpected[1]="${MSE_MD_UTEST_LOG_MESSAGES_INDENT}Atenção\n"
  tmpExpected[2]="${MSE_MD_UTEST_LOG_MESSAGES_INDENT}:: O diretório indicado não existe\n"
  tmpExpected[3]="${MSE_MD_UTEST_LOG_MESSAGES_INDENT}   nonexist-dir\n"
  tmpExpected[4]="${MSE_MD_UTEST_LOG_MESSAGES_INDENT}\n"

  testExpected=$(printf "${tmpExpected[0]}${tmpExpected[1]}${tmpExpected[2]}${tmpExpected[3]}${tmpExpected[4]}")

  mse_utest_assertEqual
}
