#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Normalizes all values of a passed-in array.
#
# Internally it uses the 'normalize_string' function for all
# values in the given array.
#
# @param array...
# Name of each of the arrays to be normalized.
#
# @return void
mse_utest_normalize_arrays() {
  local mseI
  local mseParam=""
  for mseParam in "$@"; do
    declare -n mseArray="${mseParam}"
    for mseI in "${!mseArray[@]}"; do
      mseArray["${mseI}"]=$(mse_utest_normalize_string "${mseArray[${mseI}]}")
    done
  done
}