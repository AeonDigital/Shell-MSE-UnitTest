#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







MSE_TMP_THIS_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd );
. "${MSE_TMP_THIS_DIR}/init.sh"

mse_utest_setTargetDir "$PWD/src"
mse_utest_execute
