#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compares the value of the two arrays index by index and identifies the
# difference between them.
#
# Each entry in the arrays must be treated as a single line of data in
# string format, so the presence of the '\n' character will cause an error
# in this check.
#
#
# @param string $1
# First array. Value resulting from processing.
#
# @param string $2
# Second array. With the expected value.
#
# @param string $3
# Name of the result array.
#
# @param char $4
# Type of the arrays [ "a" "A" ]
#
# @param bool $5
# Only for simple arrays "a".
# Defaults is "0" and will compare the number of keys and values, but not
# the position the values are in.
# Use "1" to compare the positions of values between both arrays.
#
# @result void
# Fills the result array with the following elements:
# [0] bool    -> '1' if the two arrays are equals.
# [1] string  -> Information about the 'result' array.
# [2] string  -> Information about the 'expected' array.
mse_utest_compare_array() {
  declare -n utestResult="${1}"
  declare -n utestExpected="${2}"
  declare -n utestArrCompareValuesResult="${3}"

  local mseTypeArrays="${4}"
  local mseCompareValuePosition="${5}"


  local mseResultInfo=""
  local mseExpectedInfo=""



  # local mseOK="1"
  # local mseMsg=""

  # declare -a mseArrCompareExpected=()
  # declare -a mseArrCompareResult=()

  # local mseCountExpected="${#utestExpected[@]}"
  # local mseCountResult="${#utestResult[@]}"

  # if [ "${mseCountExpected}" != "${mseCountResult}" ]; then
  #   mseOK="0"

  #   mseMsg="${lbl_assertArray_countElementsDoesNotMatch}"
  #   mseMsg="${mseMsg/\[\[COUNT_EXPECTED\]\]/${mseCountExpected}}"
  #   mseMsg="${mseMsg/\[\[COUNT_RESULT\]\]/${mseCountResult}}"
  #   mseArrCompareResult+=("${mseMsg}")
  # fi



  # local mseI
  # local countMatch="0"

  # if [ "${mseTypeArrays}" == "a" ]; then
  #   if [ "${mseCompareValuePosition}" == "0" ]; then
  #     local mseEValue
  #     local mseRValue

  #     for mseEValue in "${utestExpected[@]}"; do
  #       for mseRValue in "${utestResult[@]}"; do
  #         if [ "${mseRValue}" == "${mseEValue}" ]; then
  #           ((countMatch = countMatch + 1))
  #           break
  #         fi
  #       done
  #     done
  #   else
  #     for ((mseI=0; mseI < mseCountExpected; mseI++)) do
  #       if [ "${utestExpected[$mseI]}" == "${utestResult[$mseI]}" ]; then
  #         ((countMatch = countMatch + 1))
  #       fi
  #     done
  #   fi
  # elif [ "${mseTypeArrays}" == "A" ]; then
  #   for mseI in "${!utestExpected[@]}"; do
  #     if [ ! -z "${utestResult[$mseI]+x}" ] && [ "${utestExpected[$mseI]}" == "${utestResult[$mseI]}" ]; then
  #       ((countMatch = countMatch + 1))
  #     fi
  #   done
  # fi


  # if [ "${mseCountExpected}" != "${countMatch}" ]; then
  #   mseOK="0"
  #   local mseDiff="0"
  #   ((mseDiff = mseCountExpected - countMatch))

  #   mseMsg="${lbl_assertArray_countOfValuesThatDoesNotMatch}"
  #   mseMsg="${mseMsg/\[\[COUNT\]\]/${mseDiff}}"
  #   mseArrCompareResult+=("${mseMsg}")
  # fi



  # declare -a mseArrSortedKeys=()
  # local mseMaxKeyLength="0"

  # for mseI in "${!utestExpected[@]}"; do
  #   mseArrSortedKeys+=("${mseI}")

  #   if [ "${#mseI}" -gt "${mseMaxKeyLength}" ]; then
  #     mseMaxKeyLength="${#mseI}"
  #   fi
  # done

  # IFS=$'\n'
  # mseArrSortedKeys=($(mse_utest_array_print_sort "mseArrSortedKeys" "v" "a"))
  # IFS=$' \t\n'



  # local mseLineIndex=""
  # local mseLineNumber=""
  # local mseLineDiff=""
  # local mseLinePrefix=""

  # mseArrCompareExpected+=(":: EXPECTED [ count lines ${mseCountExpected} ]")
  # mseArrCompareResult+=(":: RESULT [ count lines ${mseCountResult} ]")

  # mseArrCompareExpected+=("<<<")
  # mseArrCompareResult+=("<<<")

  # for mseI in "${mseArrSortedKeys[@]}"; do
  #   mseLineMatch="[v]"
  #   if [ "${utestExpected[${mseI}]}" != "${utestResult[${mseI}]}" ]; then
  #     mseOK="0"
  #     mseLineMatch="[x]"
  #   fi

  #   mseLineIndex=$(mse_utest_str_pad "${mseI}" " " "${mseMaxKeyLength}" "l")
  #   mseLineIndent="${mseLineMatch} ${mseLineIndex}"
  #   if [ "${mseTypeArrays}" == "a" ]; then
  #     mseLineIndent+=" ::"
  #   else
  #     mseLineIndent+=" =>"
  #   fi
  #   mseArrCompareExpected+=("${mseLineIndent} ${utestResult[${mseI}]}")
  #   mseArrCompareResult+=("${mseLineIndent} ${utestResult[${mseI}]}")


  #   if [ "${mseLineMatch}" == "[x]" ]; then
  #     mseLineIndent=$(mse_utest_str_pad "" " " "${#mseLineIndent}" "l")

  #     mseLineDiff=$(mse_utest_compare_strings "${utestExpected[${mseI}]}" "${utestResult[${mseI}]}" "" "")
  #     mseArrCompareResult+=("${mseLineIndent}${mseLineDiff}")

  #     mseLineDiff=$(mse_utest_compare_strings "${utestResult[${mseI}]}" "${utestExpected[${mseI}]}" "" "")
  #     mseArrCompareExpected+=("${mseLineIndent}${mseLineDiff}")
  #   fi
  # done

  # mseArrCompareExpected+=(">>>")
  # mseArrCompareResult+=(">>>")


  # utestArrCompareValuesResult+=("${mseOK}")
  # utestArrCompareValuesResult+=("$(printf "%s\n" "${mseArrCompareResult[@]}")")
  # utestArrCompareValuesResult+=("$(printf "%s\n" "${mseArrCompareExpected[@]}")")
}