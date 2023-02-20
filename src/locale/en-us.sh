#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]







lbl_assertResult_Ok="OK"
lbl_assertResult_Fail="FAIL"
lbl_assertResult_Result="Result    :"
lbl_assertResult_Expect="Expected  :"


lbl_execute_testDirectoryNotDefined+="\n"
lbl_execute_testDirectoryNotDefined+="    Attention\n"
lbl_execute_testDirectoryNotDefined+="    No directory is defined for the tests.\n"
lbl_execute_testDirectoryNotDefined+="    Use 'mse_utest_setTargetDir' function to set each directory to be tested.\n"


lbl_execute_directoryDoesNotExists+="\n"
lbl_execute_directoryDoesNotExists+="    ::\n"
lbl_execute_directoryDoesNotExists+="    :: Directory \"[[DIR]]\" does not exist.\n"

lbl_execute_testDirectoryDoesNotExists+="\n"
lbl_execute_testDirectoryDoesNotExists+="    ::\n"
lbl_execute_testDirectoryDoesNotExists+="    :: Test directory does not exist : \"[[DIR]]\"\n"

lbl_execute_startTestsIn+="\n"
lbl_execute_startTestsIn+="    ::\n"
lbl_execute_startTestsIn+="    :: Starting tests on : \"[[DIR]]\"\n"

lbl_execute_emptyScriptDir+="\n"
lbl_execute_emptyScriptDir+="    :: Scripts directory is empty : \"[[DIR]]\"\n"

lbl_execute_emptyTestDir+="\n"
lbl_execute_emptyTestDir+="    :: Test directory is empty : \"[[DIR]]\"\n"

lbl_execute_results="Test results"
lbl_execute_results_count_scri=":: Tested scripts     :"
lbl_execute_results_count_test=":: Tests performed    :"
lbl_execute_results_count_succ=":: Success            :"
lbl_execute_results_count_fail=":: Failed             :"

lbl_setTargetDir_directoryDoesNotExists+="\n"
lbl_setTargetDir_directoryDoesNotExists+="    Attention\n"
lbl_setTargetDir_directoryDoesNotExists+="    The specified directory does not exist.\n"
lbl_setTargetDir_directoryDoesNotExists+="    [[DIR]]\n"
