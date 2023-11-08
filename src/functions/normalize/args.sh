#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Normalizes all arguments received by the script or function and
# constructs an array with its result.
#
# Internally it uses the 'normalize_string' function for all
# incoming items.
#
# @param array $1
# Name of the array that will receive the normalized values.
#
# @params...
# Each extra parameter will be used to compose the array resulting
# from normalization.
#
# @example
# ``` shell
#   my_function() {
#     declare -a arrArgs=()
#     mse_utest_normalize_args "arrArgs" "$@"
#
#     ...
#   }
# ```
#
# @return void
mse_utest_normalize_args() {
  declare -n mseArgs="${1}"
  shift

  local mseParam=""
  for mseParam in "$@"; do
    mseArgs+=("$(mse_utest_normalize_string "${mseParam}")")
  done
}