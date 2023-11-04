#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


#
# Compares the texts reported in the control variables line by line.
# Utiliza a comparação de arrays 'mse_utest_assert_arrays' para
# executar a validação
mse_utest_assert_multilineText() {
  if [ "${MSE_UTEST_STOP_TESTS}" == "0" ]; then
    local mseLineRaw
    local mseTmpTestResult="${testResult}"
    local mseTmpTestExpected="${testExpected}"

    unset testResult
    unset testExpected
    declare -a testResult=()
    declare -a testExpected=()

    IFS=$'\n'
    while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
      testResult+=("${mseLineRaw}")
    done <<< "${mseTmpTestResult}"
    while read -r mseLineRaw || [ -n "${mseLineRaw}" ]; do
      testExpected+=("${mseLineRaw}")
    done <<< "${mseTmpTestExpected}"
    IFS=$' \t\n'

    mse_utest_assert_arrays "a" "1"
  fi
}