#!/usr/bin/env bash
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

  local mseMSG



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
    mse_utest_messageSet "${lbl_execute_testDirectoryNotDefined}" 1
    mse_utest_messageShow
  else

    #
    # Para cada diretório de scripts a ser testado...
    local mseTMPDIR
    for mseTMPDIR in "${MSE_MD_UTEST_TARGET_DIRS[@]}"; do
      printf "\n"

      if [ ! -d "$mseTMPDIR" ]; then
        mseMSG=$(mse_mmod_replacePlaceHolder "DIR" "${mseTMPDIR}" "${lbl_execute_directoryDoesNotExists}")
        mse_utest_messageSet "${mseMSG}" 1
        mse_utest_messageShow
      else
        if [ ! -d "$mseTMPDIR/tests" ]; then
          mseMSG=$(mse_mmod_replacePlaceHolder "DIR" "${mseTMPDIR}/tests" "${lbl_execute_testDirectoryDoesNotExists}")
          mse_utest_messageSet "${mseMSG}" 1
          mse_utest_messageShow
        else
          mseMSG=$(mse_mmod_replacePlaceHolder "DIR" "${mseTMPDIR}" "${lbl_execute_startTestsIn}")
          mse_utest_messageSet "${mseMSG}" 1
          mse_utest_messageShow


          #
          # Identifica os arquivos de script (sh) do diretório principal
          # e os arquivos de teste correspondentes
          local mseFiles=$(find "${mseTMPDIR}/scripts" -maxdepth 1 -name "*.sh")
          local mseTestFiles=$(find "$mseTMPDIR/tests" -maxdepth 1 -name "*.sh")


          if [ "$mseFiles" == "" ]; then
            mseMSG=$(mse_mmod_replacePlaceHolder "DIR" "${mseTMPDIR}/scripts" "${lbl_execute_emptyScriptDir}")
            mse_utest_messageSet "${mseMSG}" 1
            mse_utest_messageShow
          elif [ "$mseTestFiles" == "" ]; then
            mseMSG=$(mse_mmod_replacePlaceHolder "DIR" "${mseTMPDIR}/tests" "${lbl_execute_emptyTestDir}")
            mse_utest_messageSet "${mseMSG}" 1
            mse_utest_messageShow
          else

            #
            # Carrega os arquivos de scripts e testes
            while read rawLine
            do
              . "$rawLine"
            done <<< ${mseFiles}

            while read rawLine
            do
              . "$rawLine"
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
  mse_utest_messageSet "${lbl_execute_results}"
  mse_utest_messageSet "${lbl_execute_results_count_scri} $mseCountTests"
  mse_utest_messageSet "${lbl_execute_results_count_test} $mseCountAssert"
  mse_utest_messageSet "${lbl_execute_results_count_succ} $testCountSuccess"
  mse_utest_messageSet "${lbl_execute_results_count_fail} $testCountFailed"
  mse_utest_messageSet ""
  mse_utest_messageShow
}
