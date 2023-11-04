#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Prints the values or keys of the array sorted as indicated.
#
# @param array $1
# Name of the target array.
#
# @param string $2
# Indicates whether to sort array keys or values
# Use 'v' for values and 'k' for keys.
#
# @param string $3
# Indicates the form of sorting to be done.
# use 'a' for ascendant or 'd' for descendant
#
# @return string
# The items will be written one on each line.
mse_utest_array_print_sort() {
  declare -n mseTargetArrayName="${1}"
  local mseTarget="${2}"
  local mseOrder="${3}"



  if [ "${mseTarget}" != "v" ] && [ "${mseTarget}" != "k" ]; then
    mseTarget="v"
  fi
  if [ "${mseOrder}" != "a" ] && [ "${mseOrder}" != "d" ]; then
    mseTarget="a"
  fi



  declare -a mseArray=("${mseTargetArrayName[@]}")
  if [ "${mseTarget}" == "k" ]; then
    mseArray=("${!mseTargetArrayName[@]}")
  fi


  local i
  local j
  local mseLength="${#mseArray[@]}"
  local mseTemp

  if [ "${mseOrder}" == "a" ]; then
    for ((i = 0; i < mseLength; i++)); do
      for ((j = 0; j < mseLength - i - 1; j++)); do
          if [[ "${mseArray[j]}" > "${mseArray[j + 1]}" ]]; then
              mseTemp="${mseArray[j]}"
              mseArray[j]="${mseArray[j + 1]}"
              mseArray[j + 1]="${mseTemp}"
          fi
      done
    done
  else
    for ((i = 0; i < mseLength; i++)); do
      for ((j = 0; j < mseLength - i - 1; j++)); do
          if [[ "${mseArray[j]}" < "${mseArray[j + 1]}" ]]; then
            mseTemp="${mseArray[j]}"
            mseArray[j]="${mseArray[j + 1]}"
            mseArray[j + 1]="${mseTemp}"
          fi
      done
    done
  fi


  for mseTemp in "${mseArray[@]}"; do
    echo "${mseTemp}"
  done
}