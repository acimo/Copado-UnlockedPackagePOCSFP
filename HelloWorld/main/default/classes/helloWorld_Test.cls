@IsTest
private class helloWorld_Test {
    @IsTest
    static void myTest() {
        boolean helloResult = helloWorld.sayHello();
        System.assertEquals(true, helloResult);
    }
}