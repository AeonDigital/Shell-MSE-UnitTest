#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


# MODULE VARIABLES


#
# [string] MSE_GLOBAL_UTEST_MAIN_PATH
# Stores the main path where the project is installed.
if [ -z ${MSE_GLOBAL_UTEST_MAIN_PATH+x} ]; then
  declare -g MSE_GLOBAL_UTEST_MAIN_PATH=$(spath=$(getRealPathToCurrentDirectory); echo "${spath%/*}")
fi
#
# [string] MSE_UTEST_USE_LOCALE
# Indicates the default locale to be used by this module.
# By default, it will use "en-us"
if [ -z ${MSE_UTEST_USE_LOCALE+x} ]; then
  declare -g MSE_UTEST_USE_LOCALE="en-us"
fi





#
# [array] MSE_UTEST_PATH_TO_DEPENDENCIES
# array containing the full path to scripts that must be loaded BEFORE running
# the tests.
unset MSE_UTEST_PATH_TO_DEPENDENCIES
declare -ga MSE_UTEST_PATH_TO_DEPENDENCIES=()

#
# [assoc] MSE_UTEST_FUNCTIONS_TO_SRC
# associative array correlating the name of each function with the path to the
# script containing its source code.
unset MSE_UTEST_FUNCTIONS_TO_SRC
declare -gA MSE_UTEST_FUNCTIONS_TO_SRC
#
# [assoc] MSE_UTEST_FUNCTIONS_TO_TEST
# Associative array correlating the name of each function to the path to the
# script containing its test function
unset MSE_UTEST_FUNCTIONS_TO_TEST
declare -gA MSE_UTEST_FUNCTIONS_TO_TEST





#
# [array] MSE_UTEST_LOG_MESSAGES
# Array that accumulates the messages to be exposed to the user.
unset MSE_UTEST_LOG_MESSAGES
declare -ga MSE_UTEST_LOG_MESSAGES=()

#
# [array] MSE_UTEST_LOG_MESSAGES_INDENT
# Indentation to be used in log messages.
unset MSE_UTEST_LOG_MESSAGES_INDENT
declare -ga MSE_UTEST_LOG_MESSAGES_INDENT="  "





#
# [bool] MSE_UTEST_STOP_ON_FIRST_FAIL
unset MSE_UTEST_STOP_ON_FIRST_FAIL
declare -g MSE_UTEST_STOP_ON_FIRST_FAIL="0"

#
# [bool] MSE_UTEST_STOP_TESTS
# If "1", stops the tests.
unset MSE_UTEST_STOP_TESTS
declare -g MSE_UTEST_STOP_TESTS="0"