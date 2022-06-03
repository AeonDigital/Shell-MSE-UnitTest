#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]
#
# No diretório raiz use o comando abaixo para carregar o módulo
# . src/init.sh
#
# No diretório raiz use o comando abaixo para executar os testes
# ./src/runTests.sh

#
# Configurações básicas
MSE_TMP_ISOK=1
MSE_TMP_THIS_MODULE_NAME="Shell-MSE-UnitTest"
MSE_TMP_THIS_MODULE_DEPENDENCY=()
MSE_TMP_THIS_MODULE_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
MSE_TMP_PATH_TO_MAIN_MODULE_INIT_SCRIPT=""

#
# Identifica se o módulo principal está carregado.
# Caso seja necessário, tenta carregá-lo
if [ "$(type -t "mse_mmod_registerModule")" != "function" ]; then
  MSE_TMP_PATH_TO_MAIN_MODULE_INIT_SCRIPT="${MSE_TMP_THIS_MODULE_DIRECTORY}/../Shell-MSE-Main-Module/src/init.sh"

  if [ ! -f "${MSE_TMP_PATH_TO_MAIN_MODULE_INIT_SCRIPT}" ]; then
    MSE_TMP_ISOK=0
    printf "\n"
    printf "    Attention\n"
    printf "    The module \"Shell-MSE-Main-Module\" was not loaded.\n"
    printf "    Use the following commands to load it:\n"
    printf "    - git submodule update --remote \n"
    printf "\n"
  else
    #
    # Carrega o módulo principal.
    . "${MSE_TMP_PATH_TO_MAIN_MODULE_INIT_SCRIPT}"
  fi
fi


if [ ${MSE_TMP_ISOK} == 1 ]; then
  #
  # Registra/inicia este módulo usando o módulo principal.
  mse_mmod_registerModule "${MSE_TMP_THIS_MODULE_NAME}" "${MSE_TMP_THIS_MODULE_DIRECTORY}"
fi



unset MSE_TMP_ISOK
unset MSE_TMP_THIS_MODULE_NAME
unset MSE_TMP_THIS_MODULE_DEPENDENCY
unset MSE_TMP_THIS_MODULE_DIRECTORY
unset MSE_TMP_PATH_TO_MAIN_MODULE_INIT_SCRIPT
