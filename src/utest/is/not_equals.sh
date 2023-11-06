#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compares two string values.
# Returns '1' if their are NOT equals or '0' if is.
#
# @param string $1
# First string.
#
# @param string $2
# Second string.
#
# @return bool
mse_utest_is_not_equals() {
  local mseReturn="1"
  local mseVal01=$(echo -e "${1}")
  local mseVal02=$(echo -e "${2}")

  if [ "${mseVal01}" == "${mseVal02}" ]; then
    mseReturn="0"
  fi

  echo -n "${mseReturn}"
}