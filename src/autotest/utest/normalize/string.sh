#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_utest_normalize_string() {
  local mseTestMultilineResult=""
  local mseTestMultilineExpected=""

  mseTestMultilineResult+="\ntest 0 with \`multiline\`"
  mseTestMultilineResult+="\nstring "
  mseTestMultilineExpected+="\ntest 0 with \`multiline\`"
  mseTestMultilineExpected+="\nstring "


  testResult="${mseTestMultilineResult}"
  testExpected="${mseTestMultilineExpected}"

  mse_utest_assert_equals



  testResult=$(mse_utest_normalize_string "${mseTestMultilineResult}")
  testExpected="${mseTestMultilineExpected}"

  mse_utest_assert_not_equals
}