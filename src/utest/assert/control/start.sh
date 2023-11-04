#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Identifies whether to run the test.
#
# It should be performed immediately before starting any other assertion test.
#
# @return bool
mse_utest_assert_control_start() {
  ((mseCountAssert = mseCountAssert + 1))
  ((mseInnerCountTest = mseInnerCountTest + 1))
}