#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compares the values contained in the control variables as strings.
# If there is a divergence between them, it will show the point at which
# it occurs.
#
# @controlVariables
# - testResult
# - testExpected
mse_utest_assert_string() {
  if [ $(mse_utest_control_can_assert) == "1" ]; then
    mse_utest_control_start

    unset mseCompareArrResult
    declare -a mseCompareArrResult=()

    mse_utest_compare_string "${testResult}" "${testExpected}" "mseCompareArrResult"

    if [ "${mseCompareArrResult[0]}" == "1" ]; then
      mse_utest_control_end_success
    else
      mse_utest_control_end_fail "${mseCompareArrResult[1]}" "${mseCompareArrResult[2]}"
    fi
  fi
}