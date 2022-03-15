#!/bin/bash -eu
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
    mse_mod_errorAlert "${FUNCNAME[0]}" "expected 1 argument"
  else

    #
    # Verifica se o diretório alvo existe:
    if [ ! -d "$1" ]; then
      mse_utest_messageSet "" 1
      mse_utest_messageSet "Atenção"
      mse_utest_messageSet ":: O diretório indicado não existe"
      mse_utest_messageSet "   $1"
      mse_utest_messageSet ""
      mse_utest_messageShow
    else
      local mseLength=${#MSE_MD_UTEST_TARGET_DIRS[@]}
      MSE_MD_UTEST_TARGET_DIRS[mseLength]=$1
    fi;
  fi;
}
