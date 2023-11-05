#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_utest_assert_array() {
  declare -a testResult=("first line equal" "second line equal" "Third line equal" "Fourth line is ok")
  declare -a testExpected=("first line equal" "second line equal" "Third line equal" "Fourth line is ok")

  mse_utest_assert_array "a" "1"
}