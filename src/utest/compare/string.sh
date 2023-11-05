#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compares two strings and fills the indicated array with the result
# of the comparison.
#
# The presence of '\n' character will cause an error in the check.
#
# Multiline strings will cause the test to fail.
#
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
  local mseResultInfo=""
  local mseExpectedInfo=""

  local mseCompareResult=$(mse_utest_str_trim "${1}")
  local mseCompareExpected=$(mse_utest_str_trim "${2}")
  declare -n mseArrReturn="${3}"


  if [[ "${mseCompareResult}" == *$'\n'* ]]; then
    mseIsOk="0"
    mseMsg="${lbl_compareString_valueHasAnInvalidChar}"
    mseMsg="${mseMsg/\[\[VAR\]\]/result}"
    mseMsg="${mseMsg/\[\[CHAR\]\]/NEW_LINE}"
    mseResultInfo+="${mseMsg}"
  fi
  if [[ "${mseCompareExpected}" == *$'\n'* ]]; then
    mseIsOk="0"
    mseMsg="${lbl_compareString_valueHasAnInvalidChar}"
    mseMsg="${mseMsg/\[\[VAR\]\]/expected}"
    mseMsg="${mseMsg/\[\[CHAR\]\]/NEW_LINE}"
    mseExpectedInfo+="${mseMsg}"
  fi



  if [ "${mseIsOk}" == "1" ] && [ "${mseCompareResult}" != "${mseCompareExpected}" ]; then
    local mseCompareResultLength="${#mseCompareResult}"
    local mseCompareExpectedLength="${#mseCompareExpected}"

    local mseUseLength="${mseCompareExpectedLength}"
    if [ "${mseCompareResultLength}" -gt "${mseCompareExpectedLength}" ]; then
      mseUseLength="${mseCompareResultLength}"
    fi


    local mseI
    local rChar
    local eChar
    local mseMsg=""
    local mseCharData=""

    for (( mseI=0; mseI < mseCompareExpectedLength; mseI++ )); do
      rChar="${mseCompareResult:mseI:1}"
      eChar="${mseCompareExpected:mseI:1}"

      if [ "${rChar}" == "${eChar}" ]; then
        mseMsg+="."
      else
        mseIsOk="0"
        mseMsg+="^"

        local mseUseRChar="${rChar}"
        local mseUseEChar="${eChar}"
        if [[ ! "${rChar}" =~ [[:print:]] ]]; then
          mseUseRChar="char("
          mseUseRChar+=$(printf "%d" "'${rChar}")
          mseUseRChar+=")"
        fi
        if [[ ! "${eChar}" =~ [[:print:]] ]]; then
          mseUseEChar="char("
          mseUseEChar+=$(printf "%d" "'${eChar}")
          mseUseEChar+=")"
        fi

        mseCharData=" ${lbl_assertStringDivergence_charDifferent}"
        mseCharData="${mseCharData/\[\[C1\]\]/${mseUseEChar}}"
        mseCharData="${mseCharData/\[\[C2\]\]/${mseUseRChar}}"
        break
      fi
    done

    mseResultInfo+="${mseMsg}${mseCharData}"
    mseExpectedInfo+="${mseMsg}"
  fi




  local mseStrReturnResult=""
  local mseStrReturnExpected=""
  if [ "${mseIsOk}" == "0" ]; then
    mseStrReturnResult+="\n"
    mseStrReturnExpected+="\n"
  fi
  mseStrReturnResult+="${mseCompareResult}"
  mseStrReturnExpected+="${mseCompareExpected}"
  if [ "${mseResultInfo}" != "" ]; then
    mseStrReturnResult+="\n${mseResultInfo}"
  fi
  if [ "${mseExpectedInfo}" != "" ]; then
    mseStrReturnExpected+="\n${mseExpectedInfo}"
  fi


  mseArrReturn=()
  mseArrReturn+=("${mseIsOk}")
  mseArrReturn+=("$(echo -e "${mseStrReturnResult}")")
  mseArrReturn+=("$(echo -e "${mseStrReturnExpected}")")
}