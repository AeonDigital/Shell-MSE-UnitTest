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
# Equals
autotest_mse_utest_assert_equals() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_assert_equals"]="${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/assert/equals.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_assert_equals"]="${MSE_UTEST_GLOBAL_MAIN_PATH}/src/autotest/utest/assert/equals.sh"
}
#
# Not equals
autotest_mse_utest_assert_not_equals() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_assert_not_equals"]="${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/assert/not_equals.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_assert_not_equals"]="${MSE_UTEST_GLOBAL_MAIN_PATH}/src/autotest/utest/assert/not_equals.sh"
}



#
# Compare string
autotest_mse_utest_compare_string() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_compare_string"]="${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/compare/string.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_compare_string"]="${MSE_UTEST_GLOBAL_MAIN_PATH}/src/autotest/utest/compare/string.sh"
}

#
# Assert string
autotest_mse_utest_assert_string() {
  MSE_UTEST_FUNCTIONS_TO_SRC["mse_utest_assert_string"]="${MSE_UTEST_GLOBAL_MAIN_PATH}/src/utest/assert/string.sh"
  MSE_UTEST_FUNCTIONS_TO_TEST["mse_utest_assert_string"]="${MSE_UTEST_GLOBAL_MAIN_PATH}/src/autotest/utest/assert/string.sh"
}



autotest_reset_control_data

autotest_mse_utest_assert_equals
autotest_mse_utest_assert_not_equals
autotest_mse_utest_compare_string

mse_utest_execute


# mseAutotestAssertName=""
# test_autotest_assert() {
#   declare -a mseMsg=()

#   if [ "${mseAutotestAssertName}" != "${mseAssertName}" ]; then
#     mseAutotestAssertName="${mseAssertName}"
#     mseMsg+=("ASSERT: ${mseAssertName}")
#   fi

#   mseMsg+=()
#   if [ "${mseAssertResult}" ]
# }




# #
# # Compare Strings
# test_mse_utest_compare_strings() {
#   . "${utestDir}/is/equals.sh"
#   . "${utestDir}/compare/strings.sh"
#   local mseAssertName="compare_string"



#   local mseFakeResult="This is a simple test and must pass"
#   local mseFakeExpected="This is a simple test and must pass"

#   local mseAssertResult=$(mse_utest_compare_strings "${mseFakeResult}" "${mseFakeExpected}")
#   local mseAssertResultExpected=""

#   test_autotest_assert
#   #if [ "${mseAssertResult}" == "" ]; then
#   #  mseMsg+=""
#   #fi


#   echo "${mseFakeExpected}"
#   echo "${mseFakeResult}"
#   echo "${mseAssertResult}"
# }
# test_mse_utest_compare_strings











