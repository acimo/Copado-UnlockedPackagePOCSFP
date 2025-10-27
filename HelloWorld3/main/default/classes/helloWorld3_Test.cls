@IsTest
private class helloWorld3_Test {
    @IsTest
    static void myTest() {
        boolean helloResult = helloWorld3.sayHello();
        System.assertEquals(true, helloResult);
    }
}