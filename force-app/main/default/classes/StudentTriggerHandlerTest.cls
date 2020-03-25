//Name,TestUtils,Assert,StartTest,StopTest,dataSetup(),coverage>91% are important
@isTest
public class StudentTriggerHandlerTest {
    public static List<College__c> collegeList;
    public static List<Student__c> studentList;
    public static void dataSetup(){
        collegeList=new List<College__c>();
        studentList=new List<Student__c>();
        collegeList=TestUtils.createCollegeRecords('Test College', 5, false);
        for(College__c college: collegeList){
			college.Is_Active__c=true;
            //college.State__c='Mumbai';
            
        }
        insert collegeList;
        for(Integer i=0;i<5;i++){
				studentList.addAll(TestUtils.createStudentRecords('Test Student', 10, collegeList.get(i).id,false));
        }
        insert studentList;
    }
    
    static testmethod void testStudentInsert(){
       /* List<College__c> collegeList=TestUtils.createCollegeRecords('Test College', 5, false);
        for(College__c college: collegeList){
			college.Is_Active__c=true;
            //college.State__c='Mumbai';
            
        }
        insert collegeList;
        List<Student__c> studentList =new List<Student__c>();
        for(Integer i=0;i<5;i++){
				studentList.addAll(TestUtils.createStudentRecords('Test Student', 10, collegeList.get(i).id,false));
        }
        insert studentList;*/
        dataSetup();
        for(College__c college:[SELECT Id,Count__c
                          		FROM College__c
                                WHERE Id=: collegeList.get(0).Id])
        {
                                    System.assertEquals(college.Count__c,10);
                               }
    }
    static testmethod void testStudentUpdate(){
        /*List<College__c> collegeList=TestUtils.createCollegeRecords('Test College', 5, false);
        for(College__c college: collegeList){
			college.Is_Active__c=true;
            //college.State__c='Mumbai';
            
        }
        insert collegeList;
        List<Student__c> studentList =new List<Student__c>();
        for(Integer i=0;i<5;i++){
				studentList.addAll(TestUtils.createStudentRecords('Test Student', 10, collegeList.get(i).id,false));
        }
        insert studentList;*/
        dataSetup();
        for(Student__c student:StudentList){
            if(student.College__c!=collegeList.get(0).Id){
                student.College__c=collegeList.get(0).Id;
            }
        }
        Test.startTest();
        update studentList;
        Test.stopTest();
        System.assertEquals([SELECT Count__c
                             FROM College__c
                             WHERE Id=:collegeList.get(0).Id].get(0).Count__c, 50);
    }
    static testmethod void testStudentDelete(){
        /*List<College__c> collegeList=TestUtils.createCollegeRecords('Test College', 5, false);
        for(College__c college: collegeList){
			college.Is_Active__c=true;
            //college.State__c='Mumbai';
            
        }
        insert collegeList;
        List<Student__c> studentList =new List<Student__c>();
        for(Integer i=0;i<5;i++){
				studentList.addAll(TestUtils.createStudentRecords('Test Student', 10, collegeList.get(i).id,false));
        }*/
        dataSetup();
        Test.startTest();
        DELETE studentList;
        Test.stopTest();
         System.assertEquals(0,[SELECT Count__c
                             FROM College__c
                             WHERE Id=:collegeList.get(0).Id].get(0).Count__c);
        
    }
    static testmethod void testStudentUndelete(){
		/*List<College__c> collegeList=TestUtils.createCollegeRecords('Test College', 5, false);
        for(College__c college: collegeList){
			college.Is_Active__c=true;
            //college.State__c='Mumbai';
            
        }
        insert collegeList;
        List<Student__c> studentList =new List<Student__c>();
        for(Integer i=0;i<5;i++){
				studentList.addAll(TestUtils.createStudentRecords('Test Student', 10, collegeList.get(i).id,false));
        }
        insert studentList;*/
        dataSetup();
        delete studentList;
        test.startTest();
        List<Student__c> tempStudentList=new List<Student__c>();
        tempStudentList=[SELECT Id 
                        FROM Student__c
                        WHERE College__c=:collegeList.get(0).Id ALL ROWS];
        undelete tempStudentList;
        test.stopTest();
        for(College__c college:[SELECT Id,Count__c
                          		FROM College__c
                                WHERE Id=: collegeList.get(0).Id])
        {
                                    System.assertEquals(college.Count__c,10);
                               }
        
    }
    
}