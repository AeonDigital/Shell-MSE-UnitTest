#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Normalizes a string to be used in secure comparisons.
#
# Will remove any existing NULL characters.
# Will convert every string of type "control character" such
# as \r, \n, \t to its respective command.
#
# @param string $1
# string that will be normalized.
#
# @return string
mse_utest_normalize_string() {
  local mseReturn=$(echo -e "${1//\\x0/}.")
  echo -n "${mseReturn:: -1}"
}