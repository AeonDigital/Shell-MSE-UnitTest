#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compares the values of two arrays without taking into account
# their position in the indexes.
#
# @param char $1
# Type of the arrays [ "a" "A" ]
#
# @param bool $2
# Only for simple arrays "a".
# Defaults is "0" and will compare the number of keys and values, but not
# the position the values are in.
#
# Use "1" to compare the positions of values between both arrays.
mse_utest_assert_array() {
  if [ $(mse_utest_control_can_assert) == "1" ]; then
    mse_utest_control_start

    unset mseCompareArrResult
    declare -a mseCompareArrResult=()

    mse_utest_compare_array "testResult" "testExpected" "mseCompareArrResult" "${1}" "${2}"

    if [ "${mseCompareArrResult[0]}" == "1" ]; then
      mse_utest_control_end_success
    else
      mse_utest_control_end_fail "${mseCompareArrResult[1]}" "${mseCompareArrResult[2]}"
    fi
  fi
}
