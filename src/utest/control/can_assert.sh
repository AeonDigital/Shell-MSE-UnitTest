#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Identifies whether to run the test.
#
# It should be performed immediately before starting any other assertion test.
#
# @return bool
mse_utest_control_can_assert() {
  local mseReturn="0"

  if [ "${MSE_UTEST_STOP_TESTS}" == "0" ]; then
    mseReturn="1"
  fi

  echo -n "${mseReturn}"
}