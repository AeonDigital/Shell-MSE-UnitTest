#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# This file is responsible for initiating constants, variables and global
# functions for the operation of the module as a whole.

unset MSE_GLOBAL_MD_MAIN_PATH
declare -g MSE_GLOBAL_MD_MAIN_PATH=$(dirname $(dirname $(readlink -f "${BASH_SOURCE}")))



# GLOBAL SETTINGS
if [ -z ${MSE_GLOBAL_MODULES_USE_LOCALE+x} ]; then
  declare -g MSE_GLOBAL_MODULES_USE_LOCALE="en-us"
fi
. "${MSE_GLOBAL_MD_MAIN_PATH}/src/locale/${MSE_GLOBAL_MODULES_USE_LOCALE}.sh"



# GLOBAL FUNCTION VARIABLES

#
# [array] MSE_MD_UTEST_PATH_TO_DEPENDENCIES
# array containing the full path to scripts that must be loaded BEFORE running
# the tests.
unset MSE_MD_UTEST_PATH_TO_DEPENDENCIES
declare -ga MSE_MD_UTEST_PATH_TO_DEPENDENCIES=()

#
# [assoc] MSE_MD_UTEST_FUNCTIONS_TO_SRC
# associative array correlating the name of each function with the path to the
# script containing its source code.
unset MSE_MD_UTEST_FUNCTIONS_TO_SRC
declare -gA MSE_MD_UTEST_FUNCTIONS_TO_SRC
#
# [assoc] MSE_MD_UTEST_FUNCTIONS_TO_TEST
# Associative array correlating the name of each function to the path to the
# script containing its test function
unset MSE_MD_UTEST_FUNCTIONS_TO_TEST
declare -gA MSE_MD_UTEST_FUNCTIONS_TO_TEST


#
# [array] MSE_MD_UTEST_LOG_MESSAGES
# Array that accumulates the messages to be exposed to the user.
unset MSE_MD_UTEST_LOG_MESSAGES
declare -ga MSE_MD_UTEST_LOG_MESSAGES=()

#
# [array] MSE_MD_UTEST_LOG_MESSAGES_INDENT
# Indentation to be used in log messages.
unset MSE_MD_UTEST_LOG_MESSAGES_INDENT
declare -ga MSE_MD_UTEST_LOG_MESSAGES_INDENT="  "

#
# [bool] MSE_MD_UTEST_STOP_ON_FIRST_FAIL
unset MSE_MD_UTEST_STOP_ON_FIRST_FAIL
declare -g MSE_MD_UTEST_STOP_ON_FIRST_FAIL=0






# FUNCTIONS

#
# Shows an alert message to the user.
#
# The displayed message must be prepared in the array 'MSE_MD_UTEST_LOG_MESSAGES'
# where each array item will be defined in a terminal line
mse_md_utest_messageShow() {
  local mseMsg
  for mseMsg in "${MSE_MD_UTEST_LOG_MESSAGES[@]}"; do
    printf "${MSE_MD_UTEST_LOG_MESSAGES_INDENT}${mseMsg}\n"
  done

  unset MSE_MD_UTEST_LOG_MESSAGES
  declare -ga MSE_MD_UTEST_LOG_MESSAGES=()
}


#
# @desc
# Adds a new line of information to the interface message array
# 'MSE_MD_UTEST_LOG_MESSAGES'
#
# @param string $1
# New message line
#
# @param bool $2
# Use '1' when you want the array to be reset.
#
# @example
#   mse_md_utest_messageSet "Atenção" 1
#   mse_md_utest_messageSet "Todos os arquivos serão excluídos."
mse_md_utest_messageSet() {
  if [ "$#" == "2" ] && [ "$2" == "1" ]; then
    unset MSE_MD_UTEST_LOG_MESSAGES
    declare -ga MSE_MD_UTEST_LOG_MESSAGES=()
  fi
  MSE_MD_UTEST_LOG_MESSAGES+=("${1}")
}


#
# Performs the exact comparison of control variables
# 'testResult' and 'testExpected'.
mse_md_utest_assertEqual() {
  ((mseCountAssert=mseCountAssert+1))
  ((mseInnerCountTest=mseInnerCountTest+1))

  if [ "${testResult}" == "${testExpected}" ]; then
    ((testCountSuccess=testCountSuccess+1))
    mse_md_utest_messageSet "${mseInnerCountTest} ${lbl_assertResult_Ok}" 1
    mse_md_utest_messageShow
  else
    ((testCountFailed=testCountFailed+1))
    mse_md_utest_messageSet "${mseInnerCountTest} ${lbl_assertResult_Fail}" 1
    mse_md_utest_messageSet "${lbl_assertResult_Result} ${testResult}"
    mse_md_utest_messageSet "${lbl_assertResult_Expect} ${testExpected}"
    mse_md_utest_messageShow
  fi
}


#
# Compares the values of two arrays without taking into account
# their position in the indexes.
#
# @param char $1
# Type of array [ "a" "A" ]
#
# @param bool $2
# Only for compare simple arrays.
# Use "0" to compare the number of keys and values, but not the position the values are in.
# Use 1 to compare the number of keys, values, and their positions between both arrays.
# By default uses the simplest comparison ( 0 ).
mse_md_utest_assertArrays() {
  ((mseCountAssert=mseCountAssert+1))
  ((mseInnerCountTest=mseInnerCountTest+1))

  local mseMSG
  local mseTypeArrays="${1}"
  local mseComparisonType="${2}"
  if [ "${mseComparisonType}" != "0" ] && [ "${mseComparisonType}" != "1" ]; then
    mseComparisonType="0"
  fi

  if [ "${mseTypeArrays}" != "a" ] && [ "${mseTypeArrays}" != "A" ]; then
    mseMSG="${lbl_assertArray_invalidTypeArrays/\[\[ARRAY_TYPE\]\]/${mseTypeArrays}}"
    mse_md_utest_messageSet "${mseInnerCountTest} ${mseMSG}" 1
  else
    local mseHasError="0"
    testResultType=$(declare -p "testResult" 2> /dev/null)
    testExpectedType=$(declare -p "testExpected" 2> /dev/null)

    if [ "${mseTypeArrays}" == "a" ]; then
      if [[ ! "${testResultType}" =~ "declare -a" ]]; then
        mseHasError="1"
        mse_md_utest_messageSet "${mseInnerCountTest} ${lbl_assertArray_resultIsNotAnArray}" 1
      elif [[ ! "${testExpectedType}" =~ "declare -a" ]]; then
        mseHasError="1"
        mse_md_utest_messageSet "${mseInnerCountTest} ${lbl_assertArray_expectedIsNotAnArray}" 1
      else
        local mseExpectedCount="${#testExpected[@]}"
        local mseResultCount="${#testResult[@]}"
        if [ "${mseExpectedCount}" != "${mseResultCount}" ]; then
          mseHasError="1"
          mseMSG="${lbl_assertArray_countElementsDoesNotMatch/\[\[COUNT_EXPECTED\]\]/${mseExpectedCount}}"
          mseMSG="${mseMSG/\[\[COUNT_RESULT\]\]/${mseResultCount}}"
          mse_md_utest_messageSet "${mseInnerCountTest} ${mseMSG}" 1
        fi
      fi
    elif [ "${mseTypeArrays}" == "A" ]; then
      if [[ ! "${testResultType}" =~ "declare -A" ]]; then
        mseHasError="1"
        mse_md_utest_messageSet "${mseInnerCountTest} ${lbl_assertArray_resultIsNotAnAssoc}" 1
      elif [[ ! "${testExpectedType}" =~ "declare -A" ]]; then
        mseHasError="1"
        mse_md_utest_messageSet "${mseInnerCountTest} ${lbl_assertArray_expectedIsNotAnAssoc}" 1
      fi
    fi


    if [ "${mseHasError}" == "0" ]; then
      local eKey
      local expectedValue
      local resultValue
      local countMatch=0

      if [ "${mseTypeArrays}" == "a" ]; then
        if [ "${mseComparisonType}" == "0" ]; then
          for expectedValue in "${testExpected[@]}"; do
            for resultValue in "${testResult[@]}"; do
              if [ "${resultValue}" == "${expectedValue}" ]; then
                ((countMatch = countMatch + 1))
                break
              fi
            done
          done
        else
          local i
          local t="${#testExpected[@]}"

          for ((i=0; i<t; i++)) do
            if [ "${testExpected[$i]}" == "${testResult[$i]}" ]; then
              ((countMatch = countMatch + 1))
            fi
          done
        fi
      elif [ "${mseTypeArrays}" == "A" ]; then
        for eKey in "${!testExpected[@]}"; do
          if [ ! -z "${testResult[$eKey]+x}" ] && [ "${testExpected[$eKey]}" == "${testResult[$eKey]}" ]; then
            ((countMatch = countMatch + 1))
          fi
        done
      fi


      if [ "${countMatch}" == "${#testExpected[@]}" ]; then
        ((testCountSuccess=testCountSuccess+1))
        mse_md_utest_messageSet "${mseInnerCountTest} ${lbl_assertResult_Ok}" 1
      else
        ((testCountFailed=testCountFailed+1))

        local mseTmpResult=""
        local mseTmpExpected=""

        if [ "${mseTypeArrays}" == "a" ]; then
          mseTmpResult=$(printf "%s\n" "${testResult[@]}")
          mseTmpExpected=$(printf "%s\n" "${testExpected[@]}")
        elif [ "${mseTypeArrays}" == "A" ]; then
          for eKey in "${!testResult[@]}"; do
            mseTmpResult+="${eKey}=${testResult[$eKey]}\n"
          done
          for eKey in "${!testExpected[@]}"; do
            mseTmpResult+="${eKey}=${testExpected[$eKey]}\n"
          done
        fi

        mse_md_utest_messageSet "${mseInnerCountTest} ${lbl_assertResult_Fail}" 1
        mse_md_utest_messageSet "${lbl_assertResult_Result}"
        mse_md_utest_messageSet "${mseTmpResult}"
        mse_md_utest_messageSet "${lbl_assertResult_Expect}"
        mse_md_utest_messageSet "${mseTmpExpected}"
      fi


    fi
  fi

  mse_md_utest_messageShow
}


#
# Performs a series of checks to ensure that the tests are working correctly.
mse_md_utest_checkDependenciesBeforeExecute() {
  local mseReturn=0
  local mseMSG=""


  if [ "${#MSE_MD_UTEST_FUNCTIONS_TO_SRC[@]}" == "0" ]; then
    mseReturn=1
    mse_md_utest_messageSet "${lbl_check_functionsScriptsNotDefined}" "1"
  else
    if [ "${#MSE_MD_UTEST_FUNCTIONS_TO_TEST[@]}" == "0" ]; then
      mseReturn=1
      mse_md_utest_messageSet "${lbl_check_testScriptNotDefined}" "1"
    else

      if [ "${#MSE_MD_UTEST_FUNCTIONS_TO_SRC[@]}" != "${#MSE_MD_UTEST_FUNCTIONS_TO_TEST[@]}" ]; then
        mseReturn=1
        mse_md_utest_messageSet "${lbl_check_testsAndFunctionsCountDoesNotMatch}" "1"
      else
        local mseFunctionName

        for mseFunctionName in "${!MSE_MD_UTEST_FUNCTIONS_TO_TEST[@]}"; do
          if [ "${mseReturn}" == "0" ]; then
            if [ -z "${MSE_MD_UTEST_FUNCTIONS_TO_SRC[$mseFunctionName]+x}" ]; then
              mseReturn=1

              mseMSG="${lbl_check_testWithoutFunction/\[\[FUNCTION\]\]/${mseFunctionName}}"
              mse_md_utest_messageSet "${mseMSG}" "1"
            else
              if [ ! -f "${MSE_MD_UTEST_FUNCTIONS_TO_TEST[${mseFunctionName}]}" ]; then
                mseReturn=1

                mseMSG="${lbl_check_fileDoesNotExists/\[\[FILE\]\]/${MSE_MD_UTEST_FUNCTIONS_TO_TEST[${mseFunctionName}]}}"
                mse_md_utest_messageSet "${mseMSG}" "1"
              else
                if [ ! -f "${MSE_MD_UTEST_FUNCTIONS_TO_SRC[${mseFunctionName}]}" ]; then
                  mseReturn=1

                  mseMSG="${lbl_check_fileDoesNotExists/\[\[FILE\]\]/${MSE_MD_UTEST_FUNCTIONS_TO_SRC[${mseFunctionName}]}}"
                  mse_md_utest_messageSet "${mseMSG}" "1"
                fi
              fi
            fi
          fi
        done
      fi
    fi
  fi



  if [ "${#MSE_MD_UTEST_LOG_MESSAGES[@]}" != "0" ]; then
    mse_md_utest_messageShow
  fi

  return ${mseReturn}
}


#
# Runs the battery of defined unit tests.
#
# @param string $1
# Name of function that will be tested singly.
#
# @param bool $2
# Stop tests on the first fail.
mse_md_utest_execute() {

  mse_md_utest_checkDependenciesBeforeExecute
  if [ $? == 0 ]; then
    local mseCountTests=0
    local mseCountAssert=0

    local testCountSuccess=0
    local testCountFailed=0

    local mseIterator
    local mseFunctionName


    for mseIterator in "${MSE_MD_UTEST_PATH_TO_DEPENDENCIES[@]}"; do
      . "${mseIterator}"
    done

    for mseIterator in "${MSE_MD_UTEST_FUNCTIONS_TO_SRC[@]}"; do
      . "${mseIterator}"
    done

    for mseIterator in "${MSE_MD_UTEST_FUNCTIONS_TO_TEST[@]}"; do
      . "${mseIterator}"
    done


    mse_md_utest_messageSet "${lbl_execute_startUnitTests}" 1
    mse_md_utest_messageShow


    MSE_MD_UTEST_STOP_ON_FIRST_FAIL="0"
    if [ "${2}" == "1" ]; then
      MSE_MD_UTEST_STOP_ON_FIRST_FAIL="1"
    fi


    IFS=$'\n'
    local mseFunctionsInAscOrder=($(sort <<< "${!MSE_MD_UTEST_FUNCTIONS_TO_TEST[@]}"))
    unset IFS


    for mseFunctionName in "${mseFunctionsInAscOrder[@]}"; do
      if [ "$1" == "" ] || [ "$1" == "${mseFunctionName}" ]; then
        local mseTestFullFileName="test_${mseFunctionName}"

        local testResult=""
        local testExpected=""
        local mseInnerCountTest=0

        ((mseCountTests=mseCountTests+1))

        mse_md_utest_messageSet "" 1
        mse_md_utest_messageSet "::"
        mse_md_utest_messageSet ":: ${mseFunctionName}"
        mse_md_utest_messageShow

        ${mseTestFullFileName}

        if [ "${MSE_MD_UTEST_STOP_ON_FIRST_FAIL}" == "1" ] && [ "${testCountFailed}" != "0" ]; then
          printf "\n\n${MSE_MD_UTEST_LOG_MESSAGES_INDENT}STOPED ON FIRST FAIL"
          break
        fi
      fi
    done


    mse_md_utest_messageSet "" 1
    mse_md_utest_messageSet "${lbl_execute_results}"
    mse_md_utest_messageSet "${lbl_execute_results_count_scri} $mseCountTests"
    mse_md_utest_messageSet "${lbl_execute_results_count_test} $mseCountAssert"
    mse_md_utest_messageSet "${lbl_execute_results_count_succ} $testCountSuccess"
    mse_md_utest_messageSet "${lbl_execute_results_count_fail} $testCountFailed"
    mse_md_utest_messageSet ""
    mse_md_utest_messageShow
  fi
}
