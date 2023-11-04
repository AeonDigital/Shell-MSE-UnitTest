#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Fills a string with the indicated character.
#
# @param string $1
# String that will be populated.
#
# @param char $2
# String that will be used to pad.
#
# @param int $3
# Total characters that the final string should have.
#
# @param char $4
# Position in which the filling should be done.
# Use 'l' to pad left and 'r' to pad right
#
# @return string
mse_utest_str_pad() {
  local mseReturn=""

  local mseOStr="${1}"
  local msePadChar="${2}"
  local mseTotalLength="${3}"
  local msePadPosition="${4}"

  if [ "${msePadPosition}" != "l" ] && [ "${msePadPosition}" != "r" ]; then
    msePadPosition=""
  fi


  if [ "${#msePadChar}" == "1" ] && [ "${mseTotalLength}" -gt "0" ] && [ "${msePadPosition}" != "" ]; then
    mseReturn="${mseOStr}"

    if [ "${mseTotalLength}" -gt "${#mseReturn}" ]; then
      local mseStringLength="${#mseReturn}"
      local msePadLeft="0"
      local msePadStr=""

      ((msePadLeft = mseTotalLength - mseStringLength))
      local i=""
      for ((i=0; i<msePadLeft; i++)) do
        msePadStr+="${msePadChar}"
      done

      if [ "${msePadPosition}" == "l" ]; then
        mseReturn="${msePadStr}${mseReturn}"
      elif [ "${msePadPosition}" == "r" ]; then
        mseReturn="${mseReturn}${msePadStr}"
      fi
    fi
  fi

  echo -n "${mseReturn}"
}
