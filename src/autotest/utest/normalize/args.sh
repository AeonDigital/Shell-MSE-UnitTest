#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_utest_normalize_args() {
  any_function "hello\tWorld" "   even with espaces and 'quotations'  " "more one\n" "\n\nmultiple\t\n array  "
}



any_function() {
  declare -a arrArgs=()
  mse_utest_normalize_args "arrArgs" "$@"


  testResult="${#arrArgs[@]}"
  testExpected="4"

  mse_utest_assert_equals


  testResult="${arrArgs[0]}"
  testExpected=$(mse_utest_normalize_string "hello\tWorld")

  mse_utest_assert_equals


  testResult="${arrArgs[1]}"
  testExpected=$(mse_utest_normalize_string "   even with espaces and 'quotations'  ")

  mse_utest_assert_equals


  testResult="${arrArgs[2]}"
  testExpected=$(mse_utest_normalize_string "more one\n")

  mse_utest_assert_equals


  testResult="${arrArgs[3]}"
  testExpected=$(mse_utest_normalize_string "\n\nmultiple\t\n array  ")

  mse_utest_assert_equals
}