//instead of writing same code everytime testutil is created and called only once and it can be only one for a project
public class TestUtils {
    public static List<College__c> createCollegeRecords(String name,Integer count,Boolean isInsert)
    {
        List<College__c> collegeList=new List<College__c>();
        for(Integer i=1;i<=count;i++){
            College__c college=new College__c();
            college.Name=name+i;
            collegeList.add(college);
            
        }
        if(isInsert){
			insert collegeList;
        }
        return collegeList;
    }
    public static List<Student__c> createStudentRecords(String name,Integer count,Id collegeId,Boolean isInsert){
        List<Student__c> studentList=new List<Student__c>();
        for(Integer i=1;i<=count;i++){
            Student__c student=new Student__c();
            student.Name=name+i;
            student.College__c=collegeId;
           student.Student_email__c='k@gmail.com';
            student.Phone__c='1234567890';
            studentList.add(student);
        }
        if(isInsert){
            insert studentList;
        }
        return studentList;
    }
}