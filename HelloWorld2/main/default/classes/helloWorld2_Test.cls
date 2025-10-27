@IsTest
private class helloWorld2_Test {
    @IsTest
    static void myTest() {
        boolean helloResult = helloWorld2.sayHello();
        System.assertEquals(true, helloResult);
    }
}