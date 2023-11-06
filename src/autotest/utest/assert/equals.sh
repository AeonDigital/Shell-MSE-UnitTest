#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_utest_assert_equals() {
  testResult="32000"
  testExpected="32000"

  mse_utest_assert_equals



  local mseTestMultilineResult=""
  local mseTestMultilineExpected=""

  mseTestMultilineResult+="\ntest with \`multiline\`"
  mseTestMultilineResult+="\nstring "
  mseTestMultilineExpected+="\ntest with \`multiline\`"
  mseTestMultilineExpected+="\nstring "
  mseTestMultilineExpected=$(echo -e "${mseTestMultilineExpected}")

  testResult="${mseTestMultilineResult}"
  testExpected="${mseTestMultilineExpected}"

  mse_utest_assert_equals
}
