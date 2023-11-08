#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Shows an alert message to the user.
#
# The displayed message must be prepared in the array 'MSE_UTEST_LOG_MESSAGES'
# where each array item will be defined in a terminal line.
#
# @return string
mse_utest_message_show() {
  local mseMsg
  for mseMsg in "${MSE_UTEST_LOG_MESSAGES[@]}"; do
    echo -e "${MSE_UTEST_LOG_MESSAGES_INDENT}${mseMsg}"
  done

  unset MSE_UTEST_LOG_MESSAGES
  declare -ga MSE_UTEST_LOG_MESSAGES=()
}