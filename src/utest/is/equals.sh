#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compares two string values.
# Returns '1' if their are equals or '0' if has differences.
#
# @param string $1
# First string.
#
# @param string $2
# Second string.
#
# @return bool
mse_utest_is_equals() {
  local mseReturn="0"
  local mseVal01="${1}"
  local mseVal02="${2}"

  if [ "${mseVal01}" == "${mseVal02}" ]; then
    mseReturn="1"
  fi

  echo -n "${mseReturn}"
}