#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Remove empty spaces arround the given string.
#
# @param string $1
# String that will be changed.
#
# @return string
mse_utest_str_trim() {
  local mseReturn=$(echo -e "${1}")
  mseReturn="${mseReturn#"${mseReturn%%[![:space:]]*}"}" # trim L
  mseReturn="${mseReturn%"${mseReturn##*[![:space:]]}"}" # trim R
  echo -n "${mseReturn}"
}