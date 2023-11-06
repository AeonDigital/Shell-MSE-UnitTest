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
mse_utest_assert_string_multiline() {
  if [ $(mse_utest_control_can_assert) == "1" ]; then
    mse_utest_control_start

    unset mseCompareArrResult
    declare -a mseCompareArrResult=()

    local mseLineRaw=""
    declare -a utestArrResult=()
    declare -a utestArrExpected=()


    IFS=$'\n'
    while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
      utestArrResult+=("$(echo -e ${mseLineRaw})")
    done <<< "${testResult}"

    while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
      utestArrExpected+=("$(echo -e ${mseLineRaw})")
    done <<< "${testExpected}"
    IFS=$' \t\n'

    mse_utest_compare_array "utestArrResult" "utestArrExpected" "mseCompareArrResult" "a" "1"

    if [ "${mseCompareArrResult[0]}" == "1" ]; then
      mse_utest_control_end_success
    else
      mse_utest_control_end_fail "${mseCompareArrResult[1]}" "${mseCompareArrResult[2]}"
    fi
  fi
}