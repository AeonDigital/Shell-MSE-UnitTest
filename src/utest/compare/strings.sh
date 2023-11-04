#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compares two strings and returns a line indicating the position where
# they are different.
#
# @param string $1
# First string. Expected value.
#
# @param string $2
# Second string. Result obtained from processing.
#
# @param string $3
# Prefix for the first line of information regarding the discrepancies found.
#
# @param string $4
# Prefix for the other information lines.
#
# @return string
# An empty string if both are the same.
# One or more lines of information about the divergence between them.
mse_utest_compare_strings() {
  local mseReturn

  declare -a mseArrReturn=()
  local mseCompareResult="${1}"
  local mseCompareExpected="${2}"
  local mseFirstLinePrefix="${3}"
  local mseAnotherLinesPrefix="${4}"


  if [ "${mseCompareResult}" != "${mseCompareExpected}" ]; then
    local resultCharLength="${#mseCompareResult}"
    local expectedCharLength="${#mseCompareExpected}"

    local mseI
    local rChar
    local eChar
    local mseMsg=""


    for (( mseI=0; mseI<expectedCharLength; mseI++ )); do
      rChar="${mseCompareResult:mseI:1}"
      eChar="${mseCompareExpected:mseI:1}"

      if [ "${rChar}" == "${eChar}" ]; then
        mseMsg+="."
      else
        mseMsg+="^"
      fi
    done

    if [ "${mseMsg}" != "" ]; then
      mseArrReturn+=("${mseMsg}")
    fi


    if [ "${resultCharLength}" != "${expectedCharLength}" ]; then
      mseMsg="${lbl_assertStringDivergence_charNumberDifferent}"
      mseMsg="${mseMsg/\[\[COUNT_EXPECTED\]\]/${expectedCharLength}}"
      mseMsg="${mseMsg/\[\[COUNT_RESULT\]\]/${resultCharLength}}"
      mseArrReturn+=("${mseMsg}")
    fi


    local mseArrReturnLength="${#mseArrReturn[@]}"
    if [ "${mseArrReturnLength}" != "0" ]; then
      for (( mseI=0; mseI<mseArrReturnLength; mseI++ )); do
        if [ "${mseI}" == "0" ]; then
          if [ "${mseFirstLinePrefix}" != "" ]; then
            mseReturn+="${mseFirstLinePrefix} "
          fi
        else
          mseReturn+="\n"
          if [ "${mseAnotherLinesPrefix}" != "" ]; then
            mseReturn+="${mseAnotherLinesPrefix} "
          fi
        fi

        mseReturn+="${mseArrReturn[${mseI}]}"
      done
    fi
  fi

  echo -ne "${mseReturn}"
}