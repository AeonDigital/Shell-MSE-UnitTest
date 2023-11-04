#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


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
# Use "1" to compare the number of keys, values, and their positions between both arrays.
# By default uses the simplest comparison ( 0 ).
mse_utest_assert_arrays() {
  if [ "${MSE_UTEST_STOP_TESTS}" == "0" ]; then
    ((mseCountAssert=mseCountAssert+1))
    ((mseInnerCountTest=mseInnerCountTest+1))

    local mseMsg
    local mseTypeArrays="${1}"
    local mseComparisonType="${2}"
    if [ "${mseComparisonType}" != "0" ] && [ "${mseComparisonType}" != "1" ]; then
      mseComparisonType="0"
    fi

    local mseHasError="0"
    if [ "${mseTypeArrays}" != "a" ] && [ "${mseTypeArrays}" != "A" ]; then
      mseHasError="1"
      mseMsg="${lbl_assertArray_invalidTypeArrays/\[\[ARRAY_TYPE\]\]/${mseTypeArrays}}"
      mse_utest_message_set "${mseInnerCountTest} ${mseMsg}" "1"
    else
      testResultType=$(declare -p "testResult" 2> /dev/null)
      testExpectedType=$(declare -p "testExpected" 2> /dev/null)

      if [ "${mseTypeArrays}" == "a" ]; then
        if [[ ! "${testResultType}" =~ "declare -a" ]]; then
          mseHasError="1"
          mse_utest_message_set "${mseInnerCountTest} ${lbl_assertArray_resultIsNotAnArray}" "1"
        elif [[ ! "${testExpectedType}" =~ "declare -a" ]]; then
          mseHasError="1"
          mse_utest_message_set "${mseInnerCountTest} ${lbl_assertArray_expectedIsNotAnArray}" "1"
        fi
      elif [ "${mseTypeArrays}" == "A" ]; then
        if [[ ! "${testResultType}" =~ "declare -A" ]]; then
          mseHasError="1"
          mse_utest_message_set "${mseInnerCountTest} ${lbl_assertArray_resultIsNotAnAssoc}" "1"
        elif [[ ! "${testExpectedType}" =~ "declare -A" ]]; then
          mseHasError="1"
          mse_utest_message_set "${mseInnerCountTest} ${lbl_assertArray_expectedIsNotAnAssoc}" "1"
        fi
      fi


      if [ "${mseHasError}" == "0" ]; then
        declare -a mseArrCompareValuesResult=()
        mse_utest_compare_array "testResult" "testExpected" "mseArrCompareValuesResult" "${mseTypeArrays}" "${mseComparisonType}"

        #printf "${#mseArrCompareValuesResult[@]}"
        #printf "%s\n" "${mseArrCompareValuesResult[@]}"

        if [ "${mseArrCompareValuesResult[0]}" == "1" ]; then
          ((testCountSuccess=testCountSuccess+1))
          mse_utest_message_set "${mseInnerCountTest} ${lbl_assertResult_Ok}" "1"
        else
          mseHasError="1"
          ((testCountFailed=testCountFailed+1))


          mse_utest_message_set "${mseInnerCountTest} ${lbl_assertResult_Fail}" "1"
          mse_utest_message_set "${lbl_assertResult_Result}"
          mse_utest_message_set "${mseArrCompareValuesResult[1]}"
          mse_utest_message_set "${lbl_assertResult_Expect}"
          mse_utest_message_set "${mseArrCompareValuesResult[2]}"
        fi
      fi
    fi

    mse_utest_message_show


    if [ "${mseHasError}" == "1" ] && [ "${MSE_UTEST_STOP_ON_FIRST_FAIL}" == "1" ]; then
      MSE_UTEST_STOP_TESTS="1"
      echo -e "\n\n${MSE_UTEST_LOG_MESSAGES_INDENT}:: STOPED ON FIRST FAIL ::"
    fi
  fi
}
