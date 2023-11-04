  testResult=$(mse_utest_assert_arrays)
  testExpected="  1 Invalid type of arrays (\$1); Given \"\". Expected \"a\" or \"A\"."
  mse_utest_assert_equals


  unset testResult
  unset testExpected
  testResult=""
  testExpected=""
  testResult=$(mse_utest_assert_arrays a)
  testExpected="  2 The control variable \"testResult\" is not an array"
  mse_utest_assert_equals


  unset testResult
  unset testExpected
  declare -a testResult
  testExpected=""
  testResult=$(mse_utest_assert_arrays a)
  testExpected="  3 The control variable \"testExpected\" is not an array"
  mse_utest_assert_equals


  unset testResult
  unset testExpected
  declare -a testResult=("one")
  declare -a testExpected=("one" "two")
  testResult=$(mse_utest_assert_arrays a)
  testExpected="  4 The number of items in the \"testResult\" array does not match. Expected 2 but found 1"
  mse_utest_assert_equals


  unset testResult
  unset testExpected
  declare -a testResult=("one")
  declare -a testExpected=("one" "two")
  testResult=$(mse_utest_assert_arrays A)
  testExpected="  5 The control variable \"testResult\" is not an associative array"
  mse_utest_assert_equals


  unset testResult
  unset testExpected
  declare -A testResult
  declare -a testExpected=("one" "two")
  testResult=$(mse_utest_assert_arrays A)
  testExpected="  6 The control variable \"testExpected\" is not an associative array"
  mse_utest_assert_equals


  unset testResult
  unset testExpected
  declare -a testResult=("one" "tree" "two")
  declare -a testExpected=("one" "two" "tree")
  mse_utest_assert_arrays a 0


  unset testResult
  unset testExpected
  declare -a testResult=("one" "tree" "two")
  declare -a testExpected=("one" "two" "tree")
  testResult=$(mse_utest_assert_arrays a 1)
  testResult=$(echo ${testResult%%-*})
  testExpected="8 FAIL Result : one tree two Expected : one two tree"
  mse_utest_assert_equals


  unset testResult
  unset testExpected
  declare -a testResult=("one" "two" "tree")
  declare -a testExpected=("one" "two" "tree")
  mse_utest_assert_equals


  unset testResult
  unset testExpected
  declare -A testResult
  testResult["one"]="1"
  testResult["two"]="2"
  testResult["tree"]="3"
  declare -A testExpected
  testExpected["one"]="1"
  testExpected["two"]="2"
  testExpected["tree"]="3"
  mse_utest_assert_arrays A


  unset testResult
  unset testExpected
  declare -A testResult
  testResult["one"]="1"
  testResult["two"]="2"
  testResult["four"]="4"
  declare -A testExpected
  testExpected["one"]="1"
  testExpected["two"]="2"
  testExpected["tree"]="3"
  testResult=$(mse_utest_assert_arrays A)
  testResult=$(echo ${testResult%%-*})
  testExpected="11 FAIL Result : four=4 two=2 one=1 tree=3 two=2 one=1 Expected :"
  mse_utest_assert_equals


  unset testResult
  unset testExpected
  declare -A testResult
  testResult["one"]="1"
  testResult["two"]="2"
  testResult["tree"]="33"
  declare -A testExpected
  testExpected["one"]="1"
  testExpected["two"]="2"
  testExpected["tree"]="3"
  testResult=$(mse_utest_assert_arrays A)
  testResult=$(echo ${testResult%%-*})
  testExpected="12 FAIL Result : tree=33 two=2 one=1 tree=3 two=2 one=1 Expected :"
  mse_utest_assert_equals
