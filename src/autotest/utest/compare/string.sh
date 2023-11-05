#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_utest_compare_string() {
  unset mseCompareArrResult
  declare -a mseCompareArrResult=()

  local mseFakeResult="This comparison should fail because there is an\n invalid character in it."
  local mseFakeExpected="This comparison\n should fail because there is an invalid character in it."

  mse_utest_compare_string "${mseFakeResult}" "${mseFakeExpected}" "mseCompareArrResult"

  testResult="${#mseCompareArrResult[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[0]}"
  testExpected="0"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[1]}"
  testExpected=$(echo -e "\n${mseFakeResult}\nThe value passed in 'result' has an invalid character: 'NEW_LINE'")

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[2]}"
  testExpected=$(echo -e "\n${mseFakeExpected}\nThe value passed in 'expected' has an invalid character: 'NEW_LINE'")

  mse_utest_assert_equals





  local mseFakeResult="This comparison should be successful. \n"
  local mseFakeExpected="This comparison should be successful. "

  mse_utest_compare_string "${mseFakeResult}" "${mseFakeExpected}" "mseCompareArrResult"

  testResult="${#mseCompareArrResult[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[0]}"
  testExpected="1"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[1]}"
  testExpected=$(echo -e "${mseFakeResult}")

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[2]}"
  testExpected=$(echo -e "${mseFakeExpected}")

  mse_utest_assert_equals





  local mseFakeResult="This comparison should fail. and we will have the point of where exactly the strings diverge."
  local mseFakeExpected="This comparison should fail, and we will have the point of where exactly the strings diverge."

  mse_utest_compare_string "${mseFakeResult}" "${mseFakeExpected}" "mseCompareArrResult"

  testResult="${#mseCompareArrResult[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[0]}"
  testExpected="0"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[1]}"
  testExpected=$(echo -e "\n${mseFakeResult}\n...........................^ Expected char: ','; returned : '.'")

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[2]}"
  testExpected=$(echo -e "\n${mseFakeExpected}\n...........................^")

  mse_utest_assert_equals





  local mseFakeResult="Third line equal   "
  local mseFakeExpected="Third line equal"

  mse_utest_compare_string "${mseFakeResult}" "${mseFakeExpected}" "mseCompareArrResult"

  testResult="${#mseCompareArrResult[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[0]}"
  testExpected="0"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[1]}"
  testExpected=$(echo -e "\n${mseFakeResult}\n................^ Expected char: 'char(0)'; returned : ' '")

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[2]}"
  testExpected=$(echo -e "\n${mseFakeExpected}\n................^")

  mse_utest_assert_equals
}
