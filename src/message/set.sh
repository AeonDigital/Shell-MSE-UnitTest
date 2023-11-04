#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Adds a new line of information to the interface message array
# 'MSE_UTEST_LOG_MESSAGES'.
#
# @param string $1
# New message line.
#
# @param bool $2
# Use '1' when you want the array to be reset.
#
# @example
#   mse_utest_message_set "Attention" 1
#   mse_utest_message_set "All files will be deleted."
#
# @return void
mse_utest_message_set() {
  if [ "$#" == "2" ] && [ "${2}" == "1" ]; then
    unset MSE_UTEST_LOG_MESSAGES
    declare -ga MSE_UTEST_LOG_MESSAGES=()
  fi
  MSE_UTEST_LOG_MESSAGES+=("${1}")
}
