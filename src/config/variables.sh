#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







#
# @var array
#
# Um array contendo os diretórios que possuem os scripts e testes a serem
# executados.
#
#
# SOBRE OS DIRETÓRIOS DE FUNÇÕES E TESTES
#
# É esperado que em cada diretório especificado possua um subdiretório
# chamado 'scripts' onde podem existir 1 ou mais scripts de funções a serem
# testadas. Estes arquivos devem ser nomeados com o mesmo nome da função que
# eles comportam.
#
# Também no diretório especificado deve existir um subdiretório chamado
# 'tests' e, dentro dele deverão estar alocados os arquivos que contém os
# testes a serem feitos.
# Cada arquivo de testes existentes deve ser referente a um único arquivo de
# script de função no subdiretório 'scripts'.
# Estes arquivos de testes devem ser nomeados usando o prefixo 'test_'
# seguido do nome da função que ele visa testar.
#
# Na falta do diretório 'tests' nenhum teste será executado.
# Note que você pode ter funções não testadas (sem arquivo de teste referente
# à mesma).
#
# Ao final do processo de testes será exposto na tela um resumo dos
# quantitativos de testes, falhas e sucessos.
MSE_MD_UTEST_TARGET_DIRS=()



#
# @var array
#
# Array que acumula as mensagems a serem expostas para o usuário
MSE_MD_UTEST_LOG_MESSAGES=()



#
# @var string
#
# Indentação a ser usada nas mensagens do log.
MSE_MD_UTEST_LOG_MESSAGES_INDENT="    "
