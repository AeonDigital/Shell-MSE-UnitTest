#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]
#
# No diretório raiz use o comando abaixo para carregar o módulo
# . src/init.sh
#
# No diretório raiz use o comando abaixo para executar os testes
# ./src/runTests.sh






#
# Configuração para o registro deste módulo
MSE_TMP_THIS_MODULE_NAME="UnitTest"
MSE_TMP_THIS_MODULE_DIRECTORY=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
MSE_TMP_ISOK=1
MSE_TMP_THIS_MODULE_DEPENDENCY=()



#
# Identifica se o módulo principal está carregado.
# Caso seja necessário, tenta carregá-lo
if [[ $(type -t "mse_mod_registerModule") != function ]]; then
  MSE_TMP_PATH_TO_MAIN_MODULE_INIT_SCRIPT="${MSE_TMP_THIS_MODULE_DIRECTORY}/../Shell-MSE-Main-Module/src/init.sh"

  if [ ! -f "${MSE_TMP_PATH_TO_MAIN_MODULE_INIT_SCRIPT}" ]; then
    MSE_TMP_ISOK=0

    printf "    Atenção:\n"
    printf "    O módulo 'Shell-MSE-Main-Module' não foi encontrado ou não foi carregado. \n"
    printf "    Use os seguintes comandos para adicioná-lo e configurá-lo:\n"
    printf "    - git submodule add https://github.com/AeonDigital/Shell-MSE-Main-Module.git \n"
    printf "    - git submodule set-branch --branch main -- ./Shell-MSE-Main-Module \n"
    printf "    - git submodule update --remote \n"
    printf "\n"
    printf "    Se o módulo \"Shell-MSE-Main-Module\" já faz parte do repositório atual você pode\n"
    printf "    iniciá-lo usando os comandos a seguir:\n"
    printf "    - git submodule init \n"
    printf "    - git submodule update --remote \n"
    printf "\n"
    printf "    Operação abortada!\n\n"
  else
    #
    # Carrega o módulo principal.
    source "${MSE_TMP_PATH_TO_MAIN_MODULE_INIT_SCRIPT}"
  fi

  unset MSE_TMP_PATH_TO_MAIN_MODULE_INIT_SCRIPT
fi



if [ ${MSE_TMP_ISOK} == 1 ]; then
  #
  # Carrega as variáveis do módulo caso um arquivo 'variables.sh' esteja definido
  if [ -f "${MSE_TMP_THIS_MODULE_DIRECTORY}/config/variables.sh" ]; then
    source "${MSE_TMP_THIS_MODULE_DIRECTORY}/config/variables.sh"
  fi

  #
  # Carrega os 'aliases' do módulo caso um arquivo 'aliases.sh' esteja definido
  if [ -f "${MSE_TMP_THIS_MODULE_DIRECTORY}/config/aliases.sh" ]; then
    source "${MSE_TMP_THIS_MODULE_DIRECTORY}/config/aliases.sh"
  fi

  #
  # Registra este próprio módulo
  mse_mod_registerModule "${MSE_TMP_THIS_MODULE_NAME}" "${MSE_TMP_THIS_MODULE_DIRECTORY}"

  #
  # Existindo dependências para o funcionamento deste módulo,
  # tenta carregá-las
  if [ ${#MSE_TMP_THIS_MODULE_DEPENDENCY[@]} -gt 0 ]; then
    for mseDependency in "${MSE_TMP_THIS_MODULE_DEPENDENCY[@]}";
    do
      msePathToModule="${MSE_TMP_THIS_MODULE_DIRECTORY}/../${mseDependency}/src/init.sh"
      if [ -f "${msePathToModule}" ]; then
        . "${msePathToModule}"
      fi
    done

    unset mseDependency
    unset msePathToModule
  fi
fi



unset MSE_TMP_THIS_MODULE_NAME
unset MSE_TMP_THIS_MODULE_DIRECTORY
unset MSE_TMP_THIS_MODULE_DEPENDENCY
unset MSE_TMP_ISOK
