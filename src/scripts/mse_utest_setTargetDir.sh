#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Adiciona um novo diretório a ser testado.
#
# @param string $1
# Caminho completo até um diretório contendo scripts de funções
# que devem ser testados.
mse_utest_setTargetDir() {
  local isOk=1

  if [ $# != 1 ]; then
    mse_mmod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_lostArgument}"
  else

    #
    # Verifica se o diretório alvo existe:
    if [ ! -d "$1" ]; then
      local mseMSG
      mseMSG=$(mse_str_replacePlaceHolder "${lbl_setTargetDir_directoryDoesNotExists}" "DIR" "$1")
      mse_utest_messageSet "${mseMSG}" 1
      mse_utest_messageShow
    else
      MSE_MD_UTEST_TARGET_DIRS+=("${1}")
    fi;
  fi;
}
