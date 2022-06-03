#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @desc
# Adiciona uma nova linha de informação no array de mensagem de interface
# 'MSE_MD_UTEST_LOG_MESSAGES'
#
# @param string $1
# Nova linha da mensagem
#
# @param bool $2
# Use '1' quando quiser que o array seja reiniciado.
# Qualquer outro valor não causará efeitos
#
# @example
#   mse_utest_messageSet "Atenção" 1
#   mse_utest_messageSet "Todos os arquivos serão excluídos."
mse_utest_messageSet() {
  if [ $# == 2 ] && [ $2 == 1 ]; then
    MSE_MD_UTEST_LOG_MESSAGES=()
  fi
  MSE_MD_UTEST_LOG_MESSAGES+=("$1")
}
