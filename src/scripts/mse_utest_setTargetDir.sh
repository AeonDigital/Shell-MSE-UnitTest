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
    mse_mod_errorAlert "${FUNCNAME[0]}" "${lbl_genericError_lostArgument}"
  else

    #
    # Verifica se o diretório alvo existe:
    if [ ! -d "$1" ]; then
      local mseMSG
      mseMSG=$(mse_mod_replacePlaceHolder "DIR" "$1" "${lbl_setTargetDir_directoryDoesNotExists}")
      mse_utest_messageSet "${mseMSG}" 1
      mse_utest_messageShow
    else
      local mseLength=${#MSE_MD_UTEST_TARGET_DIRS[@]}
      MSE_MD_UTEST_TARGET_DIRS[mseLength]=$1
    fi;
  fi;
}
