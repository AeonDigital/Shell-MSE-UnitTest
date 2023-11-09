#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_utest_assert_not_equals() {
  local mseTestMultilineResult=""
  local mseTestMultilineExpected=""

  mseTestMultilineResult+="\ntest with \`multiline\`"
  mseTestMultilineResult+="\nstring "
  mseTestMultilineExpected+="\ntest with \`multiline\`"
  mseTestMultilineExpected+="\nstring "
  mseTestMultilineExpected=$(mse_utest_normalize_string "${mseTestMultilineExpected}")

  testResult="${mseTestMultilineResult}"
  testExpected="${mseTestMultilineExpected}"

  mse_utest_assert_not_equals
}
