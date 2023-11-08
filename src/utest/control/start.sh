#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Identifies whether to run the test.
#
# It should be performed immediately before starting any other assertion test.
#
# @return bool
mse_utest_control_start() {
  ((mseCountAssert = mseCountAssert + 1))
  ((mseInnerCountTest = mseInnerCountTest + 1))

  if [ "${mseTestSection}" != "" ]; then
    mse_utest_message_set "\n${MSE_UTEST_LOG_MESSAGES_INDENT}${MSE_UTEST_LOG_MESSAGES_INDENT}::  ${mseTestSection}" "1"
    mse_utest_message_show

    mseTestSection=""
  fi
}