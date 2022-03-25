#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Mostra uma mensagem de alerta para o usuário.
#
# A mensagem mostrada deve ser preparada no array ${MSE_MD_UTEST_LOG_MESSAGES}
# onde, cada item do array será definido em uma linha do terminal
mse_utest_messageShow() {
  if [ ${#MSE_MD_UTEST_LOG_MESSAGES[@]} == 0 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_emptyArray} MSE_MD_UTEST_LOG_MESSAGES"
  else
    local mseMsg
    for mseMsg in "${MSE_MD_UTEST_LOG_MESSAGES[@]}"; do
      printf "${MSE_MD_UTEST_LOG_MESSAGES_INDENT}${mseMsg}\n"
    done

    MSE_MD_UTEST_LOG_MESSAGES=()
  fi
}
