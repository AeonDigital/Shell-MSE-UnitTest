#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Provides functions required to launch MSE-compatible modules.


#
# Returns the full path of the script in which this function was evoked.
# Uses the current values of PWD and BASH_SOURCE variables.
#
# @return string
# Real path to the current script.
getRealPathToCurrentScript() {
  local mseRealPath="${PWD}"
  local mseTmpSource="${BASH_SOURCE}"
  if [ "${mseTmpSource:0:2}" == "./" ]; then mseTmpSource="${mseTmpSource:2}"; fi
  if [ "${mseTmpSource:0:1}" == "/" ]; then mseTmpSource="${mseTmpSource:1}"; fi

  local msePart=""
  while [ "${mseTmpSource}" != "" ]; do
    msePart="${mseTmpSource%%/*}"

    if [ "${msePart}" == ".." ]; then
      mseRealPath="${mseRealPath%/*}"
    else
      mseRealPath+="/${msePart}"
    fi

    if [[ "${mseTmpSource}" == *"/"* ]]; then
      mseTmpSource="${mseTmpSource#*/}"
    else
      mseTmpSource=""
    fi
  done

  if [ -f "${mseRealPath}" ] || [ -d "${mseRealPath}" ]; then
    echo -n "${mseRealPath}"
  else
    echo -n ""
  fi
}
#
# Returns the full path to the directory where this script is running.
# Uses the current values of PWD and BASH_SOURCE variables.
#
# @return string
# Full path to the current script directory.
getRealPathToCurrentDirectory() {
  local mseThisRealPathToCurrentScript=$(getRealPathToCurrentScript)
  echo "${mseThisRealPathToCurrentScript%/*}"
}



#
# Performs a series of checks to ensure that the tests are working correctly.
checkUTestDataBeforeExecute() {
  local mseReturn="0"
  local mseMsg=""


  if [ "${#MSE_UTEST_FUNCTIONS_TO_SRC[@]}" == "0" ]; then
    mseReturn="1"
    mse_utest_message_set "${lbl_check_functionsScriptsNotDefined}" "1"
  else
    if [ "${#MSE_UTEST_FUNCTIONS_TO_TEST[@]}" == "0" ]; then
      mseReturn="1"
      mse_utest_message_set "${lbl_check_testScriptNotDefined}" "1"
    else

      if [ "${#MSE_UTEST_FUNCTIONS_TO_SRC[@]}" != "${#MSE_UTEST_FUNCTIONS_TO_TEST[@]}" ]; then
        mseReturn="1"
        mse_utest_message_set "${lbl_check_testsAndFunctionsCountDoesNotMatch}" "1"
      else
        local mseFunctionName

        for mseFunctionName in "${!MSE_UTEST_FUNCTIONS_TO_TEST[@]}"; do
          if [ "${mseReturn}" == "0" ]; then
            if [ -z "${MSE_UTEST_FUNCTIONS_TO_SRC[$mseFunctionName]+x}" ]; then
              mseReturn="1"

              mseMsg="${lbl_check_testWithoutFunction/\[\[FUNCTION\]\]/${mseFunctionName}}"
              mse_utest_message_set "${mseMsg}" "1"
            else
              if [ ! -f "${MSE_UTEST_FUNCTIONS_TO_TEST[${mseFunctionName}]}" ]; then
                mseReturn="1"

                mseMsg="${lbl_check_fileDoesNotExists/\[\[FILE\]\]/${MSE_UTEST_FUNCTIONS_TO_TEST[${mseFunctionName}]}}"
                mse_utest_message_set "${mseMsg}" "1"
              else
                if [ ! -f "${MSE_UTEST_FUNCTIONS_TO_SRC[${mseFunctionName}]}" ]; then
                  mseReturn="1"

                  mseMsg="${lbl_check_fileDoesNotExists/\[\[FILE\]\]/${MSE_UTEST_FUNCTIONS_TO_SRC[${mseFunctionName}]}}"
                  mse_utest_message_set "${mseMsg}" "1"
                fi
              fi
            fi
          fi
        done
      fi
    fi
  fi



  if [ "${#MSE_UTEST_LOG_MESSAGES[@]}" != "0" ]; then
    mse_utest_message_show
  fi

  return ${mseReturn}
}



#
# Loads the scripts needed to start testing.
#
# @return void
loadUtestDependencies() {
  local mseTmpFile=""
  local mseTmpDirs=("functions" "message" "utest")

  for mseTmpDir in "functions" "message" "utest"; do
    for mseTmpFile in $(find "${MSE_GLOBAL_UTEST_MAIN_PATH}/src/${mseTmpDir}" -type f -path "*.sh"); do
      . "${mseTmpFile}"
    done
  done
}



. "${BASH_SOURCE%/*}/mseVars.sh"
. "${BASH_SOURCE%/*}/locale/${MSE_UTEST_USE_LOCALE}.sh"