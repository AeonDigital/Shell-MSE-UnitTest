#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário.
#
# A mensagem mostrada deve ser preparada no array ${MSE_MD_UTEST_LOG_MESSAGES}
# onde, cada item do array será definido em uma linha do terminal
mse_utest_messageShow() {
  local mseMsg
  for mseMsg in "${MSE_MD_UTEST_LOG_MESSAGES[@]}"; do
    printf "${MSE_MD_UTEST_LOG_MESSAGES_INDENT}${mseMsg}\n"
  done

  MSE_MD_UTEST_LOG_MESSAGES=()
}
