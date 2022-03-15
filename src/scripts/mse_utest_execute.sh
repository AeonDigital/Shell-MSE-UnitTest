#!/bin/bash -eu
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Executa a bateria de testes unitários definidos nos diretórios alvo.
mse_utest_execute() {
  local isOk=1

  local mseCountTests=0
  local mseCountAssert=0

  local testResult=""
  local testExpected=""
  local testCountSuccess=0
  local testCountFailed=0



  # Importante!!!
  # sem isto as conversões de caracteres falham
  # Este 'set' funciona na maior parte dos sistemas testados até o momento.
  if [ -z ${LC_CTYPE+x} ]; then
    LC_CTYPE=""
  fi
  local tmp_LC_CTYPE="${LC_CTYPE}"
  LC_CTYPE=C



  #
  # Não havendo diretórios de scripts a serem testados...
  if [ ${#MSE_MD_UTEST_TARGET_DIRS[@]} == 0 ]; then
    isOk=0
    mse_utest_messageSet "" 1
    mse_utest_messageSet "Atenção"
    mse_utest_messageSet ":: Nenhum diretório está definido para os testes."
    mse_utest_messageSet "   Use a função 'mse_utest_setTargetDir' para definir cada diretório a ser testado"
    mse_utest_messageSet ""
    mse_utest_messageShow
  else

    #
    # Para cada diretório de scripts a ser testado...
    local mseTMPDIR
    for mseTMPDIR in "${MSE_MD_UTEST_TARGET_DIRS[@]}"; do
      printf "\n"

      if [ ! -d "$mseTMPDIR" ]; then
        mse_utest_messageSet "::" 1
        mse_utest_messageSet ":: O diretório \"${mseTMPDIR}\" não existe"
        mse_utest_messageShow
      else
        if [ ! -d "$mseTMPDIR/tests" ]; then
          mse_utest_messageSet "::" 1
          mse_utest_messageSet ":: Diretório de testes inexistente: $mseTMPDIR/tests"
          mse_utest_messageShow
        else
          mse_utest_messageSet "::" 1
          mse_utest_messageSet ":: Iniciando testes em: $mseTMPDIR"
          mse_utest_messageShow


          #
          # Identifica os arquivos de script (sh) do diretório principal
          # e os arquivos de teste correspondentes
          local mseFiles=$(find "${mseTMPDIR}/scripts" -name "*.sh")
          local mseTestFiles=$(find "$mseTMPDIR/tests" -name "*.sh")


          if [ "$mseFiles" == "" ]; then
            mse_utest_messageSet "::" 1
            mse_utest_messageSet ":: Diretório vazio: $mseTMPDIR"
            mse_utest_messageShow
          elif [ "$mseTestFiles" == "" ]; then
            mse_utest_messageSet "::" 1
            mse_utest_messageSet ":: Diretório de testes vazio: $mseTMPDIR/tests"
            mse_utest_messageShow
          else

            #
            # Carrega os arquivos de scripts e testes
            while read rawLine
            do
              source "$rawLine"
            done <<< ${mseFiles}

            while read rawLine
            do
              source "$rawLine"
            done <<< ${mseTestFiles}



            #
            # Executa a função de teste de cada arquivo de teste identificado
            while read rawLine
            do
              local mseFullFileName=$(basename -- "$rawLine")
              local mseExtension="${mseFullFileName##*.}"
              local mseFilename="${mseFullFileName%.*}"
              local mseInnerCountTest=0



              ((mseCountTests=mseCountTests+1))

              mse_utest_messageSet "::" 1
              mse_utest_messageSet ":: $mseFilename"
              mse_utest_messageShow
              $mseFilename
            done <<< ${mseTestFiles}

          fi
        fi
      fi
    done
  fi



  LC_CTYPE="${tmp_LC_CTYPE}"

  mse_utest_messageSet "" 1
  mse_utest_messageSet "Resumo dos testes"
  mse_utest_messageSet ":: Scripts testados   : $mseCountTests"
  mse_utest_messageSet ":: Testes executados  : $mseCountAssert"
  mse_utest_messageSet ":: Sucesso            : $testCountSuccess"
  mse_utest_messageSet ":: Falhas             : $testCountFailed"
  mse_utest_messageSet ""
  mse_utest_messageShow
}
