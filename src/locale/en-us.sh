#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


lbl_check_functionsScriptsNotDefined=""
lbl_check_functionsScriptsNotDefined+="\n"
lbl_check_functionsScriptsNotDefined+="  Attention\n"
lbl_check_functionsScriptsNotDefined+="  No function or script has been defined to run the tests.\n\n"
lbl_check_functionsScriptsNotDefined+="  Fill in the associative array 'MSE_UTEST_FUNCTIONS_TO_SRC' \n"
lbl_check_functionsScriptsNotDefined+="  with the name (key) of each function to be tested and the full \n"
lbl_check_functionsScriptsNotDefined+="  path to the script that defines its source code (value)."


lbl_check_testScriptNotDefined=""
lbl_check_testScriptNotDefined+="\n"
lbl_check_testScriptNotDefined+="  Attention\n"
lbl_check_testScriptNotDefined+="  No functions or tests scripts have been set to run.\n\n"
lbl_check_testScriptNotDefined+="  Fill in the associative array 'MSE_UTEST_FUNCTIONS_TO_TEST' \n"
lbl_check_testScriptNotDefined+="  with the name (key) of each function to be tested and the full \n"
lbl_check_testScriptNotDefined+="  path to the script that defines its tests source code (value)."


lbl_check_testsAndFunctionsCountDoesNotMatch=""
lbl_check_testsAndFunctionsCountDoesNotMatch+="\n"
lbl_check_testsAndFunctionsCountDoesNotMatch+="  Attention\n"
lbl_check_testsAndFunctionsCountDoesNotMatch+="  Function script count does not match number of test scripts.\n\n"
lbl_check_testsAndFunctionsCountDoesNotMatch+="  Please fix it and try again."


lbl_check_testWithoutFunction=""
lbl_check_testWithoutFunction+="\n"
lbl_check_testWithoutFunction+="  Attention\n"
lbl_check_testWithoutFunction+="  Test for function \"[[FUNCTION]]\" defined without function source code.\n\n"
lbl_check_testWithoutFunction+="  Review the selection of items to test and try again.\n"


lbl_check_fileDoesNotExists=""
lbl_check_fileDoesNotExists+="\n"
lbl_check_fileDoesNotExists+="  Attention\n"
lbl_check_fileDoesNotExists+="  :: File \"[[FILE]]\" does not exist.\n"



lbl_execute_startUnitTests=""
lbl_execute_startUnitTests+="\n"
lbl_execute_startUnitTests+="::\n"
lbl_execute_startUnitTests+=":: Starting unit tests\n"

lbl_execute_results="Test results"
lbl_execute_results_count_scri=":: Tested scripts     :"
lbl_execute_results_count_test=":: Tests performed    :"
lbl_execute_results_count_succ=":: Success            :"
lbl_execute_results_count_fail=":: Failed             :"



lbl_assertResult_Ok="OK"
lbl_assertResult_Fail="FAIL"
lbl_assertResult_Result="Result    :"
lbl_assertResult_Indent="           "
lbl_assertResult_Expect="Expected  :"
lbl_assertResult_IndentAnotherLines="             "
lbl_assertResult_StopInFirstFail=":: STOPED ON FIRST FAIL ::"



lbl_compareString_valueHasAnInvalidChar="The value passed in '[[VAR]]' has an invalid character: '[[CHAR]]'"
lbl_assertStringDivergence_charNumberDifferent="Different number of characters. Expected [[COUNT_EXPECTED]] but counted [[COUNT_RESULT]]."

# lbl_assertArray_invalidTypeArrays="Invalid type of arrays (\$1); Given \"[[ARRAY_TYPE]]\". Expected \"a\" or \"A\"."
# lbl_assertArray_resultIsNotAnArray="The control variable \"testResult\" is not an array"
# lbl_assertArray_expectedIsNotAnArray="The control variable \"testExpected\" is not an array"
# lbl_assertArray_countElementsDoesNotMatch="The number of items in the \"testResult\" array does not match. Expected [[COUNT_EXPECTED]] but found [[COUNT_RESULT]]"
# lbl_assertArray_countOfValuesThatDoesNotMatch="Among the values found in the \"testResult\" array there are [[COUNT]] that do not correspond to expected values."
# lbl_assertArray_resultIsNotAnAssoc="The control variable \"testResult\" is not an associative array"
# lbl_assertArray_expectedIsNotAnAssoc="The control variable \"testExpected\" is not an associative array"