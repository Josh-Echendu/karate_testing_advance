package com.tests;

import com.intuit.karate.junit5.Karate;

class RunnerTest {

    // @Karate.Test
    // Karate testJsonServer() { // Karate is the return type of the method

    //     //relativeTo method helps to locate feature file path
    //     return Karate.run("JsonServerCrudTest").relativeTo(getClass());
    // }

    // @Karate.Test
    // Karate runTestUsingClassPath() {

    //     return Karate.run("classpath:com/tests/MatchKeyword.feature");

    // }


    // @Karate.Test
    // Karate runTestUsingClassPath1() {

    //     return Karate.run("classpath:com/tests/validateJSONArray.feature");

    // }

    // @Karate.Test
    // Karate runTestUsingClassPath2() {

    //     return Karate.run("classpath:com/tests/getRequest/variable.feature");

    // }

    // @Karate.Test
    // Karate runTestUsingClassPath3() {

    //     return Karate.run("classpath:com/tests/postRequest/postRequest.feature");

    // }

    // @Karate.Test
    // Karate runTestUsingClassPath4() {

    //     return Karate.run("classpath:com/tests/postRequest/postRequestReadingFile.feature");

    // }
    
    // @Karate.Test
    // Karate runTestUsingClassPath5() {

    //     return Karate.run("classpath:com/tests/postRequest/javaScriptExecutor.feature");

    // }

    @Karate.Test
    Karate runTestUsingClassPath6() {

        return Karate.run("classpath:com/tests/postRequest/embededExpression.feature");

    }

    // @Karate.Test
    // Karate runTestUsingClassPath5() {

    //     return Karate.run("classpath:com/tests/postRequest/withdrawal.feature");

    // }

}
