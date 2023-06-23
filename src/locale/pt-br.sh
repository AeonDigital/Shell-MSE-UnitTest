#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


lbl_check_functionsScriptsNotDefined=""
lbl_check_functionsScriptsNotDefined+="\n"
lbl_check_functionsScriptsNotDefined+="  Atenção\n"
lbl_check_functionsScriptsNotDefined+="  Nenhum script de função foi definido para executar os testes.\n\n"
lbl_check_functionsScriptsNotDefined+="  Preencha o array associativo 'MSE_MD_UTEST_FUNCTIONS_TO_SRC'\n"
lbl_check_functionsScriptsNotDefined+="  com o nome (chave) de cada função a ser testada e o caminho completo \n"
lbl_check_functionsScriptsNotDefined+="  até o script que define seu código fonte (value)."


lbl_check_testScriptNotDefined=""
lbl_check_testScriptNotDefined+="\n"
lbl_check_testScriptNotDefined+="  Atenção\n"
lbl_check_testScriptNotDefined+="  Nenhuma função ou script de testes foi definida.\n\n"
lbl_check_testScriptNotDefined+="  Preencha o array associativo 'MSE_MD_UTEST_FUNCTIONS_TO_TEST' \n"
lbl_check_testScriptNotDefined+="  com o nome (chave) de cada função a ser testada e o caminho completo \n"
lbl_check_testScriptNotDefined+="  até o script que define o código fonte do teste (valor)."


lbl_check_testsAndFunctionsCountDoesNotMatch=""
lbl_check_testsAndFunctionsCountDoesNotMatch+="\n"
lbl_check_testsAndFunctionsCountDoesNotMatch+="  Atenção\n"
lbl_check_testsAndFunctionsCountDoesNotMatch+="  As contagens de scripts de funções e de testes não correspondem.\n\n"
lbl_check_testsAndFunctionsCountDoesNotMatch+="  Por favor, corrija isto e tente novamente."


lbl_check_testWithoutFunction=""
lbl_check_testWithoutFunction+="\n"
lbl_check_testWithoutFunction+="  Atenção\n"
lbl_check_testWithoutFunction+="  O teste para a função \"[[FUNCTION]]\" foi definido sem sua função correspondente.\n\n"
lbl_check_testWithoutFunction+="  Revise a seleção dos itens do teste e tente novamente.\n"


lbl_check_testWithoutFunction=""
lbl_check_testWithoutFunction+="\n"
lbl_check_testWithoutFunction+="  ::\n"
lbl_check_testWithoutFunction+="  :: O arquivo \"[[FILE]]\" não existe.\n"



lbl_execute_startUnitTests=""
lbl_execute_startUnitTests+="\n"
lbl_execute_startUnitTests+="::\n"
lbl_execute_startUnitTests+=":: Iniciando testes unitários\n"

lbl_execute_results="Resultados dos testes"
lbl_execute_results_count_scri=":: Scripts testados   :"
lbl_execute_results_count_test=":: Testes executados  :"
lbl_execute_results_count_succ=":: Sucesso            :"
lbl_execute_results_count_fail=":: Falhas             :"



lbl_assertResult_Ok="OK"
lbl_assertResult_Fail="FALHA"
lbl_assertResult_Result="Resultado :"
lbl_assertResult_Expect="Esperado  :"


lbl_assertArray_invalidTypeArrays="Tipo inválido (\$1); Recebido \"[[ARRAY_TYPE]]\". Experado \"a\" ou \"A\"."
lbl_assertArray_resultIsNotAnArray="A variável de controle \"testResult\" não é um array"
lbl_assertArray_expectedIsNotAnArray="A variável de controle \"testExpected\" não é um array"
lbl_assertArray_countElementsDoesNotMatch="O número de itens no array \"testResult\" está incorreto. Experados [[COUNT_EXPECTED]] mas encontrados [[COUNT_RESULT]]"
lbl_assertArray_resultIsNotAnAssoc="A variável de controle \"testResult\" não é um array associativo"
lbl_assertArray_expectedIsNotAnAssoc="A variável de controle \"testExpected\" não é um array associativo"