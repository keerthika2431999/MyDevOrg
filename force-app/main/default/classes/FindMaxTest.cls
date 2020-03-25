@isTest
public class FindMaxTest {
    static testmethod void testMax(){
        FindMax obj=new FindMax();
        obj.getMaximum(10, 15);
        System.assertEquals(15, obj.max);
    }
	static testmethod void testMax2(){
        FindMax obj=new FindMax();
        obj.getMaximum(15, 10);
        System.assertEquals(15, obj.max);
    }
}
//instead of @isTest testmethod can be used