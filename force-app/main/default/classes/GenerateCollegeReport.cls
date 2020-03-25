public class GenerateCollegeReport {
    public GenerateCollegeReport(){
        Map<Id,Set<Id>> collegetoStudentMap=new Map<ID,Set<Id>>();
        Set<Id> allStudentIdSet=new Set<Id>();
        for(College__c college: [SELECT Id,Name,
                                 (SELECT Id,Name FROM Students__r)
                                FROM College__c
                                 WHERE Is_Active__c=TRUE]){
                                     if(!collegetoStudentMap.containsKey(college.Id)){
                                         Set<Id> tempIdSet=new Set<Id>();
                                         for(Student__c student:college.Students__r){
                                             tempIdSet.add(student.Id);
                                             allStudentIdSet.add(student.Id);
                                         }
                                         collegetoStudentMap.put(college.Id,tempIdSet);
                                     }
                                    
                                 }
        Map<Id,Decimal> studenttoMarksMap=new Map<Id,Decimal>();
        for(Student__c student:[SELECT Id,Name,(SELECT Id,Score__c FROM Marks__r)
                               FROM Student__c
                                WHERE Id IN:allStudentIdSet]){
                                    if(!studenttoMarksMap.containsKey(student.Id)){
                                        Decimal temp=0;
                                        for(Mark__c marks:student.Marks__r){
                                            temp=temp+marks.Score__c;
                                        }
                                        studenttoMarksMap.put(student.Id,temp);
                                    }
                                }
         System.debug(studenttoMarksMap);
            					
    }

}