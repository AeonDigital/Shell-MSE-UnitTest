#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_utest_normalize_arrays() {
  declare -a arrNormalize01=("hello\tWorld" "   even with espaces and 'quotations'  ")
  declare -a arrNormalize02=("more one\n" "\n\nmultiple\t\n array  ")
  mse_utest_normalize_arrays "arrNormalize01" "arrNormalize02"

  testResult="${#arrNormalize01[@]}"
  testExpected="2"

  mse_utest_assert_equals


  testResult="${arrNormalize01[0]}"
  testExpected=$(mse_utest_normalize_string "hello\tWorld")

  mse_utest_assert_equals


  testResult="${arrNormalize01[1]}"
  testExpected=$(mse_utest_normalize_string "   even with espaces and 'quotations'  ")

  mse_utest_assert_equals



  testResult="${#arrNormalize02[@]}"
  testExpected="2"

  mse_utest_assert_equals


  testResult="${arrNormalize02[0]}"
  testExpected=$(mse_utest_normalize_string "more one\n")

  mse_utest_assert_equals


  testResult="${arrNormalize02[1]}"
  testExpected=$(mse_utest_normalize_string "\n\nmultiple\t\n array  ")

  mse_utest_assert_equals
}