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

  if [ -f ${mseRealPath} ] || [ -d ${mseRealPath} ]; then
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






. "${BASH_SOURCE%/*}/mseVars.sh"
. "${BASH_SOURCE%/*}/locale/${MSE_UTEST_USE_LOCALE}.sh"

if [ ${1} == "" ] || [ "${1}" != "autotest" ]; then
  mseTmpFile=""
  for mseTmpFile in $(find "${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest" -type f -path "*.sh"); do
    . ${mseTmpFile}
  done
  unset mseTmpFile
fi