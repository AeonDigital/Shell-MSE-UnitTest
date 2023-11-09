#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compares the value of the two arrays index by index and identifies the
# difference between them.
#
# Each entry in the arrays must be treated as a single line of data in
# string format and will be compared using the 'mse_utest_compare_string'
# function.
#
#
# @param array|assoc $1
# Name of first array. Value resulting from processing.
#
# @param array|assoc $2
# Name of second array. With the expected value.
#
# @param array $3
# Name of the result array.
#
# @param char $4
# Type of the arrays [ "a" "A" ]
#
# @param bool $5
# Only for simple arrays "a".
# Defaults is "0" and will compare the number of keys and values, but not
# the position the values are in.
#
# Use "1" to compare the positions of values between both arrays.
#
#
# @result void
# Fills the result array with the following elements:
# [0] bool    -> '1' if the two arrays are equals.
# [1] string  -> Information about the 'result' array.
# [2] string  -> Information about the 'expected' array.
mse_utest_compare_array() {
  local mseIsOk="1"
  local mseMsg=""
  declare -a mseArrMsg=()

  declare -n utestResult="${1}"
  declare -n utestExpected="${2}"
  declare -n mseArrReturn="${3}"

  local mseTypeArrays="${4}"
  local mseCompareValuePosition="${5}"
  if [ "${mseCompareValuePosition}" != "0" ] && [ "${mseCompareValuePosition}" != "1" ]; then
    mseCompareValuePosition="0"
  fi


  if [ "${mseTypeArrays}" != "a" ] && [ "${mseTypeArrays}" != "A" ]; then
    mseIsOk="0"

    mseMsg="${lbl_assertArray_criticalError_invalidTypeArrays}"
    mseMsg="${mseMsg/\[\[ARRAY_TYPE\]\]/${mseTypeArrays}}"
    mseArrMsg+=("${mseMsg}")
  else
    testResultType=$(declare -p "${1}" 2> /dev/null)
    testExpectedType=$(declare -p "${2}" 2> /dev/null)

    if [ "${mseTypeArrays}" == "a" ]; then
      if [[ ! "${testResultType}" =~ "declare -a" ]]; then
        mseIsOk="0"
        mseArrMsg+=("${lbl_assertArray_criticalError_resultIsNotAnArray}")
      fi

      if [[ ! "${testExpectedType}" =~ "declare -a" ]]; then
        mseIsOk="0"
        mseArrMsg+=("${lbl_assertArray_criticalError_expectedIsNotAnArray}")
      fi
    elif [ "${mseTypeArrays}" == "A" ]; then
      if [[ ! "${testResultType}" =~ "declare -A" ]]; then
        mseIsOk="0"
        mseArrMsg+=("${lbl_assertArray_criticalError_resultIsNotAnAssoc}")
      fi
      if [[ ! "${testExpectedType}" =~ "declare -A" ]]; then
        mseIsOk="0"
        mseArrMsg+=("${lbl_assertArray_criticalError_expectedIsNotAnAssoc}")
      fi
    fi
  fi





  #
  # CRITICAL ERROR
  if [ "${mseIsOk}" == "0" ]; then
    mseArrMsg=("\n${lbl_assertArray_criticalError}" "${mseArrMsg[@]}")

    mseArrReturn=()
    mseArrReturn+=("${mseIsOk}")
    mseArrReturn+=("$(mse_utest_array_print_inLines "mseArrMsg")")
    mseArrReturn+=("")
  else
    local mseCountResultElements="${#utestResult[@]}"
    local mseCountExpectedElements="${#utestExpected[@]}"

    if [ "${mseCountResultElements}" != "${mseCountExpectedElements}" ]; then
      mseIsOk="0"

      mseMsg="${lbl_assertArray_countElementsDoesNotMatch}"
      mseMsg="${mseMsg/\[\[COUNT_EXPECTED\]\]/${mseCountExpectedElements}}"
      mseMsg="${mseMsg/\[\[COUNT_RESULT\]\]/${mseCountResultElements}}"

      mseArrReturn=()
      mseArrReturn+=("${mseIsOk}")
      mseArrReturn+=("$(echo -e "\n${mseMsg}")")
      mseArrReturn+=("")
    else

      if [ "${mseTypeArrays}" == "a" ]; then
        declare -a utestCompareArrResult=()
        declare -a utestCompareArrExpected=()
      else
        declare -A utestCompareArrResult
        declare -A utestCompareArrExpected
      fi

      # Normalizes the values to make the comparison
      local mseI
      local mseJ
      local countMatch="0"

      for mseI in "${!utestExpected[@]}"; do
        utestCompareArrResult[${mseI}]=$(mse_utest_normalize_string "${utestResult[${mseI}]}")
        utestCompareArrExpected[${mseI}]=$(mse_utest_normalize_string "${utestExpected[${mseI}]}")
      done




      # Counts the number of elements with unmatched values
      if [ "${mseTypeArrays}" == "a" ]; then
        if [ "${mseCompareValuePosition}" == "0" ]; then
          local mseEValue
          local mseRValue

          unset mseMatchIndex
          declare -A mseMatchIndex

          for mseI in "${!utestCompareArrExpected[@]}"; do
            mseEValue="${utestCompareArrExpected[${mseI}]}"
            mseMatchIndex["${mseI}"]="-"

            for mseJ in "${!utestCompareArrResult[@]}"; do
              mseRValue="${utestCompareArrResult[${mseJ}]}"

              if [ "${mseRValue}" == "${mseEValue}" ] && [ "${mseMatchIndex[${mseI}]}" == "-" ]; then
                mseMatchIndex["${mseI}"]="${mseJ}"
                ((countMatch = countMatch + 1))
                break
              fi
            done
          done
        else
          for mseI in "${!utestCompareArrExpected[@]}"; do
            if [ "${utestCompareArrExpected[${mseI}]}" == "${utestCompareArrResult[${mseI}]}" ]; then
              ((countMatch = countMatch + 1))
            fi
          done
        fi
      elif [ "${mseTypeArrays}" == "A" ]; then
        for mseI in "${!utestCompareArrExpected[@]}"; do
          if [ ! -z "${utestCompareArrResult[${mseI}]+x}" ] && [ "${utestCompareArrExpected[${mseI}]}" == "${utestCompareArrResult[${mseI}]}" ]; then
            ((countMatch = countMatch + 1))
          fi
        done
      fi




      #
      # If all elements of the result array found a pair in the
      # array of expected values, the test was successful.
      if [ "${mseCountExpectedElements}" == "${countMatch}" ]; then
        mseArrReturn=()
        mseArrReturn+=("${mseIsOk}")
        mseArrReturn+=("")
        mseArrReturn+=("")
      else

        #
        # Otherwise, you need to identify the points where the arrays diverge.
        mseIsOk="0"

        local mseMaxKeyLength="0"
        local mseMaxResultLength="0"
        local mseMaxExpectedLength="0"

        declare -a utestCompareSortKeys=()

        for mseI in "${!utestCompareArrExpected[@]}"; do
          utestCompareSortKeys+=("${mseI}")
          if [ "${#mseI}" -gt "${mseMaxKeyLength}" ]; then
            mseMaxKeyLength="${#mseI}"
          fi


          if [ "${#utestCompareArrResult[${mseI}]}" -gt "${mseMaxResultLength}" ]; then
            mseMaxResultLength="${#utestCompareArrResult[${mseI}]}"
          fi
          if [ "${#utestCompareArrExpected[${mseI}]}" -gt "${mseMaxExpectedLength}" ]; then
            mseMaxExpectedLength="${#utestCompareArrExpected[${mseI}]}"
          fi
        done

        IFS=$'\n'
        utestCompareSortKeys=($(mse_utest_array_print_sort "utestCompareSortKeys" "v" "a"))
        IFS=$' \t\n'



        local mseElemMatch=""
        local mseElemIndex=""
        local mseElemSepar=""
        local msePrefixLine=""
        local mseIndentLine=""

        local mseUseLine=""
        local mseIsFirstLine="1"

        local mseStrReturnReportLines=""
        local mseStrExpectedReportLines=""

        declare -a mseArrReturnResultReport=("")
        declare -a mseArrReturnExpectedReport=("")
        declare -a mseCompareString=()


        mseMsg="${lbl_assertArray_compareResultReport_firstLine}"
        mseMsg="${mseMsg/\[\[ROWS\]\]/${mseCountResultElements}}"
        mseMsg="${mseMsg/\[\[COLS\]\]/${mseMaxResultLength}}"
        mseArrReturnResultReport+=("${mseMsg}")

        mseMsg="${lbl_assertArray_compareExpectedReport_firstLine}"
        mseMsg="${mseMsg/\[\[ROWS\]\]/${mseCountExpectedElements}}"
        mseMsg="${mseMsg/\[\[COLS\]\]/${mseMaxExpectedLength}}"
        mseArrReturnExpectedReport+=("${mseMsg}")



        mseArrReturnResultReport+=("<<<")
        mseArrReturnExpectedReport+=("<<<")

        for mseI in "${utestCompareSortKeys[@]}"; do
          mse_utest_compare_string "${utestCompareArrResult[${mseI}]}" "${utestCompareArrExpected[${mseI}]}" "mseCompareString"

          mseElemMatch="[v]"
          if [ "${mseCompareString[0]}" == "0" ]; then
            mseElemMatch="[x]"
          fi

          mseElemIndex=$(mse_utest_str_pad "${mseI}" " " "${mseMaxKeyLength}" "l")

          mseElemSepar="::"
          if [ "${mseTypeArrays}" == "A" ]; then
            mseElemSepar="=>"
          fi

          mseStrReturnReportLines=$(echo -e "${mseCompareString[1]}")
          mseStrExpectedReportLines=$(echo -e "${mseCompareString[2]}")


          msePrefixLine="${mseElemMatch} ${mseElemIndex} ${mseElemSepar} "
          mseIndentLine=$(mse_utest_str_pad "" " " "${#msePrefixLine}" "l")

          IFS=$'\n'
          mseIsFirstLine="1"
          while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
            if [ "${mseIsFirstLine}" == "1" ]; then
              if [ "${mseLineRaw}" != "" ]; then
                mseUseLine=$(mse_utest_str_pad "${mseLineRaw}" " " "${mseMaxResultLength}" "r")
                mseArrReturnResultReport+=("${msePrefixLine}${mseUseLine} |")
                mseIsFirstLine="0"
              fi
            else
              mseArrReturnResultReport+=("${mseIndentLine}${mseLineRaw}")
            fi
          done <<< "${mseStrReturnReportLines}"


          mseIsFirstLine="1"
          while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
            if [ "${mseIsFirstLine}" == "1" ]; then
              if [ "${mseLineRaw}" != "" ]; then
                mseUseLine=$(mse_utest_str_pad "${mseLineRaw}" " " "${mseMaxResultLength}" "r")
                mseArrReturnExpectedReport+=("${msePrefixLine}${mseUseLine} |")
                mseIsFirstLine="0"
              fi
            else
              mseArrReturnExpectedReport+=("${mseIndentLine}${mseLineRaw}")
            fi
          done <<< "${mseStrExpectedReportLines}"
          IFS=$' \t\n'
        done

        mseArrReturnResultReport+=(">>>")
        mseArrReturnExpectedReport+=(">>>")


        mseArrReturn=()
        mseArrReturn+=("${mseIsOk}")
        mseArrReturn+=("$(printf "%s\n" "${mseArrReturnResultReport[@]}")")
        mseArrReturn+=("$(printf "%s\n" "${mseArrReturnExpectedReport[@]}")")
      fi
    fi
  fi
}