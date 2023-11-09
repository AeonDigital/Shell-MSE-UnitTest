#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Prints the contents of the array passed on 1 line
# per existing entry.
#
# @param array $1
# Name of the target array.
#
# @return string
# One or more rows of data representing the values
# of the array.
mse_utest_array_print_inLines() {
  declare -n assocName="${1}"
  for v in "${assocName[@]}"; do
    echo -e "${v}"
  done
}