@isTest
public class SumOfTwoNumbersTest {
	@isTest
    static void testSum(){
        SumOfTwoNumbers obj=new SumOfTwoNumbers();
        obj.a=10;
        obj.b=5;
        obj.printSum();
        System.assertEquals(14, obj.c);
    } 
}