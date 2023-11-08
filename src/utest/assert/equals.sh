#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Checks whether the value contained in the control variables are
# identical values.
#
# @controlVariables
# - testResult
# - testExpected
mse_utest_assert_equals() {
  if [ $(mse_utest_control_can_assert) == "1" ]; then
    mse_utest_control_start

    if [ $(mse_utest_is_equals "${testResult}" "${testExpected}") == "1" ]; then
      mse_utest_control_end_success
    else
      mse_utest_control_end_fail
    fi
  fi
}