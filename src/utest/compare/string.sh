#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compares two strings and fills the indicated array with the result
# of the comparison.
#
# Strings provided for comparison will be truncated at the
# first '\n' character found.
#
# Multiline strings will cause the test to fail.
#
# @param string $1
# First string. Value resulting from processing.
#
# @param string $2
# Second string. With the expected value.
#
# @param array $3
# Name of the result array.
#
# @result void
# Fills the result array with the following elements:
# [0] bool    -> '1' if the two strings are equals.
# [1] string  -> Information about the 'result' string.
# [2] string  -> Information about the 'expected' string.
mse_utest_compare_string() {
  local mseIsOk="1"
  local mseMsg=""
  local mseResultData=""
  local mseExpectedData=""

  local mseCompareResult=$(echo -e "${1}")
  local mseCompareExpected=$(echo -e "${2}")
  declare -n mseArrReturn="${3}"


  if [[ "${mseCompareResult}" == *$'\n'* ]]; then
    mseIsOk="0"
    mseMsg="${lbl_compareString_valueHasAnInvalidChar}"
    mseMsg="${mseMsg/\[\[VAR\]\]/result}"
    mseMsg="${mseMsg/\[\[CHAR\]\]/NEW_LINE}"
    mseResultData+="${mseMsg}"
  fi
  if [[ "${mseCompareExpected}" == *$'\n'* ]]; then
    mseIsOk="0"
    mseMsg="${lbl_compareString_valueHasAnInvalidChar}"
    mseMsg="${mseMsg/\[\[VAR\]\]/expected}"
    mseMsg="${mseMsg/\[\[CHAR\]\]/NEW_LINE}"
    mseExpectedData+="${mseMsg}"
  fi



  if [ "${mseIsOk}" == "1" ] && [ "${mseCompareResult}" != "${mseCompareExpected}" ]; then
    local mseCompareResultLength="${#mseCompareResult}"
    local mseCompareExpectedLength="${#mseCompareExpected}"

    if [ "${mseCompareResultLength}" != "${mseCompareExpectedLength}" ]; then
      mseIsOk="0"
      mseMsg="${lbl_assertStringDivergence_charNumberDifferent}"
      mseMsg="${mseMsg/\[\[COUNT_EXPECTED\]\]/${mseCompareExpectedLength}}"
      mseMsg="${mseMsg/\[\[COUNT_RESULT\]\]/${mseCompareResultLength}}"
      mseResultData+="${mseMsg}"
    else
      local mseI
      local rChar
      local eChar
      local mseMsg=""

      for (( mseI=0; mseI < mseCompareExpectedLength; mseI++ )); do
        rChar="${mseCompareResult:mseI:1}"
        eChar="${mseCompareExpected:mseI:1}"

        if [ "${rChar}" == "${eChar}" ]; then
          mseMsg+="."
        else
          mseIsOk="0"
          mseMsg+="^"
          break
        fi
      done

      mseResultData+="\n${mseCompareResult}\n${mseMsg}"
      mseExpectedData+="\n${mseCompareExpected}\n${mseMsg}"
    fi
  fi



  mseArrReturn=()
  mseArrReturn+=("${mseIsOk}")
  mseArrReturn+=("$(echo -e "${mseResultData}")")
  mseArrReturn+=("$(echo -e "${mseExpectedData}")")
}