#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







lbl_assertResult_Ok="OK"
lbl_assertResult_Fail="FALHA"
lbl_assertResult_Result="Resultado :"
lbl_assertResult_Expect="Esperado  :"


lbl_execute_testDirectoryNotDefined+="\n"
lbl_execute_testDirectoryNotDefined+="    Atenção\n"
lbl_execute_testDirectoryNotDefined+="    Nenhum diretório está definido para os testes.\n"
lbl_execute_testDirectoryNotDefined+="    Use a função 'mse_utest_setTargetDir' para definir cada diretório a ser testado.\n"


lbl_execute_directoryDoesNotExists+="\n"
lbl_execute_directoryDoesNotExists+="    ::\n"
lbl_execute_directoryDoesNotExists+="    :: O diretório \"[[DIR]]\" não existe.\n"

lbl_execute_testDirectoryDoesNotExists+="\n"
lbl_execute_testDirectoryDoesNotExists+="    ::\n"
lbl_execute_testDirectoryDoesNotExists+="    :: Diretório de testes inexistente : \"[[DIR]]\"\n"

lbl_execute_startTestsIn+="\n"
lbl_execute_startTestsIn+="    ::\n"
lbl_execute_startTestsIn+="    :: Iniciando testes em : \"[[DIR]]\"\n"

lbl_execute_emptyScriptDir+="\n"
lbl_execute_emptyScriptDir+="    :: Diretório de scripts está vazio : \"[[DIR]]\"\n"

lbl_execute_emptyTestDir+="\n"
lbl_execute_emptyTestDir+="    :: Diretório de testes está vazio : \"[[DIR]]\"\n"

lbl_execute_results="Resultados dos testes"
lbl_execute_results_count_scri=":: Scripts testados   :"
lbl_execute_results_count_test=":: Testes executados  :"
lbl_execute_results_count_succ=":: Sucesso            :"
lbl_execute_results_count_fail=":: Falhas             :"

lbl_setTargetDir_directoryDoesNotExists+="\n"
lbl_setTargetDir_directoryDoesNotExists+="    Atenção"
lbl_setTargetDir_directoryDoesNotExists+="    O diretório indicado não existe.\n"
lbl_setTargetDir_directoryDoesNotExists+="    [[DIR]]\n"
