#!/usr/bin/env bash
# myShellEnv v 1.0 [aeondigital.com.br]


test_mse_utest_assert_string_multiline() {
  testResult="\n"
  testResult+="Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n"
  testResult+="Ut venenatis libero vitae hendrerit rhoncus. Donec mattis, nibh vel \n"
  testResult+="placerat eleifend, mauris erat malesuada lorem, id elementum orci erat \n"
  testResult+="pellentesque diam. Sed quis nisi odio. Ut facilisis dolor eros, et \n"
  testResult+="iaculis lectus consequat sed. Nullam eu sagittis dolor."


  testExpected="\n"
  testExpected+="Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n"
  testExpected+="Ut venenatis libero vitae hendrerit rhoncus. Donec mattis, nibh vel \n"
  testExpected+="placerat eleifend, mauris erat malesuada lorem, id elementum orci erat \n"
  testExpected+="pellentesque diam. Sed quis nisi odio. Ut facilisis dolor eros, et \n"
  testExpected+="iaculis lectus consequat sed. Nullam eu sagittis dolor."


  mse_utest_assert_string_multiline
}