#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Provides a battery of tests for the assertion functions of this module
autotest_reset_control_data() {
  unset MSE_UTEST_PATH_TO_DEPENDENCIES
  declare -ga MSE_UTEST_PATH_TO_DEPENDENCIES=()

  unset MSE_UTEST_FUNCTIONS_TO_SRC
  declare -gA MSE_UTEST_FUNCTIONS_TO_SRC

  unset MSE_UTEST_FUNCTIONS_TO_TEST
  declare -gA MSE_UTEST_FUNCTIONS_TO_TEST
}



#
# Normalize
autotest_mse_utest_normalize() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_normalize_string"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/functions/normalize/string.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_normalize_string"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/autotest/utest/normalize/string.sh"

  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_normalize_arrays"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/functions/normalize/arrays.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_normalize_arrays"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/autotest/utest/normalize/arrays.sh"

  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_normalize_args"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/functions/normalize/args.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_normalize_args"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/autotest/utest/normalize/args.sh"
}



#
# Equals
autotest_mse_utest_assert_equals() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_assert_equals"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/utest/assert/equals.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_assert_equals"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/autotest/utest/assert/equals.sh"
}
#
# Not equals
autotest_mse_utest_assert_not_equals() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_assert_not_equals"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/utest/assert/not_equals.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_assert_not_equals"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/autotest/utest/assert/not_equals.sh"
}



#
# Compare string
autotest_mse_utest_compare_string() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_compare_string"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/utest/compare/string.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_compare_string"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/autotest/utest/compare/string.sh"
}
#
# Compare array
autotest_mse_utest_compare_array() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_compare_array"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/utest/compare/array.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_compare_array"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/autotest/utest/compare/array.sh"
}



#
# Assert string
autotest_mse_utest_assert_string() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_assert_string"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/utest/assert/string.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_assert_string"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/autotest/utest/assert/string.sh"
}
#
# Assert array
autotest_mse_utest_assert_array() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_assert_array"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/utest/assert/array.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_assert_array"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/autotest/utest/assert/array.sh"
}
#
# Assert array
autotest_mse_utest_assert_string_multiline() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_assert_string_multiline"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/utest/assert/string_multiline.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_assert_string_multiline"]="${MSE_GLOBAL_UTEST_MAIN_PATH}/src/autotest/utest/assert/string_multiline.sh"
}