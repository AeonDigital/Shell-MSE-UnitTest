#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Prints the success message related to the same on the screen.
#
# @return string
mse_utest_control_end_success() {
  ((testCountSuccess = testCountSuccess + 1))

  mse_utest_message_set "${mseInnerCountTest} ${lbl_assertResult_Ok}" "1"
  mse_utest_message_show
}