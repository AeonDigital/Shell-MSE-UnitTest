#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_utest_compare_array() {
  test_mse_utest_compare_array_critical_error_01
  test_mse_utest_compare_array_critical_error_02
  test_mse_utest_compare_array_critical_error_03



  unset mseArrFakeResult
  declare -a mseArrFakeResult=()
  unset mseArrFakeExpected
  declare -a mseArrFakeExpected=()
  unset mseCompareArrResult
  declare -a mseCompareArrResult=()

  local mseTmpTestMsg=""





  mseTmpTestMsg=""
  mseArrFakeResult=("one" "two")
  mseArrFakeExpected=("one" "two" "tree")

  mse_utest_compare_array "mseArrFakeResult" "mseArrFakeExpected" "mseCompareArrResult" "a"

  testResult="${#mseCompareArrResult[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[0]}"
  testExpected="0"

  mse_utest_assert_equals


  mseTmpTestMsg="${lbl_assertArray_countElementsDoesNotMatch}"
  mseTmpTestMsg="${mseTmpTestMsg/\[\[COUNT_EXPECTED\]\]/3}"
  mseTmpTestMsg="${mseTmpTestMsg/\[\[COUNT_RESULT\]\]/2}"

  testResult="${mseCompareArrResult[1]}"
  testExpected=$(echo -e "\n${mseTmpTestMsg}")

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[2]}"
  testExpected=""

  mse_utest_assert_equals





  mseTmpTestMsg=""
  mseArrFakeResult=("first line equal" "second line equal" "Third line equal" "Fourth line is ok")
  mseArrFakeExpected=("first line equal" "second line equal" "Third line equal" "Fourth line is ok")

  mse_utest_compare_array "mseArrFakeResult" "mseArrFakeExpected" "mseCompareArrResult" "a"

  testResult="${#mseCompareArrResult[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[0]}"
  testExpected="1"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[1]}"
  testExpected=""

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[2]}"
  testExpected=""

  mse_utest_assert_equals





  mseTmpTestMsg=""
  mseArrFakeResult=("first line equal" "second line equal" "Third line is not equal" "Fourth line is ok")
  mseArrFakeExpected=("first line equal" "second line equal" "Third line equal" "Fourth line is ok")

  mse_utest_compare_array "mseArrFakeResult" "mseArrFakeExpected" "mseCompareArrResult" "a"

  testResult="${#mseCompareArrResult[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[0]}"
  testExpected="0"

  mse_utest_assert_equals



  mseTmpTestMsg="\n"
  mseTmpTestMsg+=":: RESULT ARRAY [ rows: 4 | cols: 23 ]\n"
  mseTmpTestMsg+="<<<\n"
  mseTmpTestMsg+="[v] 0 :: first line equal        |\n"
  mseTmpTestMsg+="[v] 1 :: second line equal       |\n"
  mseTmpTestMsg+="[x] 2 :: Third line is not equal |\n"
  mseTmpTestMsg+="         ...........^ Expected char: 'e'; returned : 'i'\n"
  mseTmpTestMsg+="[v] 3 :: Fourth line is ok       |\n"
  mseTmpTestMsg+=">>>"

  testResult="${mseCompareArrResult[1]}"
  testExpected=$(echo -e "${mseTmpTestMsg}")

  mse_utest_assert_equals




  mseTmpTestMsg=""
  mseTmpTestMsg+="\n:: EXPECTED ARRAY [ rows: 4 | cols: 17 ]\n"
  mseTmpTestMsg+="<<<\n"
  mseTmpTestMsg+="[v] 0 :: first line equal        |\n"
  mseTmpTestMsg+="[v] 1 :: second line equal       |\n"
  mseTmpTestMsg+="[x] 2 :: Third line equal        |\n"
  mseTmpTestMsg+="         ...........^\n"
  mseTmpTestMsg+="[v] 3 :: Fourth line is ok       |\n"
  mseTmpTestMsg+=">>>"
  testResult="${mseCompareArrResult[2]}"
  testExpected=$(echo -e "${mseTmpTestMsg}")

  mse_utest_assert_equals





  mseTmpTestMsg=""
  mseArrFakeResult=("first line equal" "second line equal" "Third line equal   " "Fourth line is ok")
  mseArrFakeExpected=("first line equal" "second line equal" "Third line equal" "Fourth line is ok")

  mse_utest_compare_array "mseArrFakeResult" "mseArrFakeExpected" "mseCompareArrResult" "a"

  testResult="${#mseCompareArrResult[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[0]}"
  testExpected="0"

  mse_utest_assert_equals



  mseTmpTestMsg="\n"
  mseTmpTestMsg+=":: RESULT ARRAY [ rows: 4 | cols: 19 ]\n"
  mseTmpTestMsg+="<<<\n"
  mseTmpTestMsg+="[v] 0 :: first line equal    |\n"
  mseTmpTestMsg+="[v] 1 :: second line equal   |\n"
  mseTmpTestMsg+="[x] 2 :: Third line equal    |\n"
  mseTmpTestMsg+="         ................^ Expected char: 'char(0)'; returned : ' '\n"
  mseTmpTestMsg+="[v] 3 :: Fourth line is ok   |\n"
  mseTmpTestMsg+=">>>"

  testResult="${mseCompareArrResult[1]}"
  testExpected=$(echo -e "${mseTmpTestMsg}")

  mse_utest_assert_equals




  mseTmpTestMsg="\n"
  mseTmpTestMsg+=":: EXPECTED ARRAY [ rows: 4 | cols: 17 ]\n"
  mseTmpTestMsg+="<<<\n"
  mseTmpTestMsg+="[v] 0 :: first line equal    |\n"
  mseTmpTestMsg+="[v] 1 :: second line equal   |\n"
  mseTmpTestMsg+="[x] 2 :: Third line equal    |\n"
  mseTmpTestMsg+="         ................^\n"
  mseTmpTestMsg+="[v] 3 :: Fourth line is ok   |\n"
  mseTmpTestMsg+=">>>"

  testResult="${mseCompareArrResult[2]}"
  testExpected=$(echo -e "${mseTmpTestMsg}")

  mse_utest_assert_equals
}





test_mse_utest_compare_array_critical_error_01() {
  unset mseCompareArrResult
  declare -a mseCompareArrResult=()

  local mseFakeResult="Wrong type of object."
  local mseFakeExpected="Wrong type of object."

  local mseTmpTestMsg=""



  #
  # CRITICAL ERROR
  mse_utest_compare_array "mseFakeResult" "mseFakeExpected" "mseCompareArrResult"

  testResult="${#mseCompareArrResult[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[0]}"
  testExpected="0"

  mse_utest_assert_equals


  mseTmpTestMsg=$(echo -e "\n${lbl_assertArray_criticalError}\n${lbl_assertArray_criticalError_invalidTypeArrays/\[\[ARRAY_TYPE\]\]/}")
  testResult="${mseCompareArrResult[1]}"
  testExpected="${mseTmpTestMsg}"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[2]}"
  testExpected=""

  mse_utest_assert_equals
}





test_mse_utest_compare_array_critical_error_02() {
  unset mseCompareArrResult
  declare -a mseCompareArrResult=()

  declare -A mseFakeResult=()
  local -A mseFakeExpected

  local mseTmpTestMsg=""



  #
  # CRITICAL ERROR
  mse_utest_compare_array "mseFakeResult" "mseFakeExpected" "mseCompareArrResult" "a"

  testResult="${#mseCompareArrResult[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[0]}"
  testExpected="0"

  mse_utest_assert_equals


  mseTmpTestMsg=$(echo -e "\n${lbl_assertArray_criticalError}\n${lbl_assertArray_criticalError_resultIsNotAnArray}\n${lbl_assertArray_criticalError_expectedIsNotAnArray}")
  testResult="${mseCompareArrResult[1]}"
  testExpected="${mseTmpTestMsg}"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[2]}"
  testExpected=""

  mse_utest_assert_equals
}





test_mse_utest_compare_array_critical_error_03() {
  unset mseCompareArrResult
  declare -a mseCompareArrResult=()

  declare -a mseFakeResult
  local -a mseFakeExpected

  local mseTmpTestMsg=""



  #
  # CRITICAL ERROR
  mse_utest_compare_array "mseFakeResult" "mseFakeExpected" "mseCompareArrResult" "A"

  testResult="${#mseCompareArrResult[@]}"
  testExpected="3"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[0]}"
  testExpected="0"

  mse_utest_assert_equals


  mseTmpTestMsg=$(echo -e "\n${lbl_assertArray_criticalError}\n${lbl_assertArray_criticalError_resultIsNotAnAssoc}\n${lbl_assertArray_criticalError_expectedIsNotAnAssoc}")
  testResult="${mseCompareArrResult[1]}"
  testExpected="${mseTmpTestMsg}"

  mse_utest_assert_equals


  testResult="${mseCompareArrResult[2]}"
  testExpected=""

  mse_utest_assert_equals
}