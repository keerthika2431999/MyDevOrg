public class StudentTriggerHandler {
    //counting total no.of students for a particular college
    public static void countStudent(List<Student__c> newList,Map<Id,Student__c> oldMap){
        Set<Id> collegeIdSet = new Set<Id>();
        //inserting and updating 
        if(newList!=null){
        for(Student__c student : newList){
            if((oldMap==null || student.College__c!=oldMap.get(student.Id).College__c) && student.College__c!=null ){
  				collegeIdSet.add(student.College__c);
            }
            if(oldMap!=null && oldMap.get(student.Id).College__c!=null ){
                collegeIdSet.add(oldMap.get(student.Id).College__c);
            }
        }
        }
        //deleting
        if(newList==null && oldMap!=null){
            for(Id studentId:oldMap.keySet()){
                if(oldMap.get(studentId).College__c!=null){
                    collegeIdSet.add(oldMap.get(studentId).College__c);
                }	
            }
        }
        /*Map<Id,College__c> collegeUpdateMap =new Map<Id,College__c>();
        for(Id collegeId: collegeIdSet)
        {
            College__c college=new College__c();
            college.Id=collegeId;
            college.Count__c=0;
            collegeUpdateMap.put(collegeId,college);
        }        
       /* for(AggregateResult ar:[SELECT College__c ,COUNT(Id) 
                                 FROM Student__c
                                 WHERE College__c IN :collegeIdSet
                                 Group By College__c]){
                                     College__c temp = collegeUpdateMap.get((Id) ar.get('College__c'));
                                     temp.Count__c=(Decimal) ar.get('expr0');
                                     collegeUpdateMap.put((Id) ar.get('College__c'),temp);
                                 }*/
        Map<Id,Integer> collegeIdToStudentCountMap=new Map<Id,Integer>();
        
        for(Student__c student:[SELECT Id,College__c
                                FROM Student__c
                                WHERE College__c IN :collegeIdSet]){
                                    if(!collegeIdToStudentCountMap.containsKey(student.College__c)) {
                                        collegeIdToStudentCountMap.put(student.College__c,0);
                                    }
                                    
                                    Integer count = collegeIdToStudentCountMap.get(student.College__c);
                                    count++;
                                    collegeIdToStudentCountMap.put(student.College__c,count);
                                    }
        //to make the count as 0 after the last record is deleted
        List<College__c> collegeUpdateList=new List<College__c>();
        for(Id collegeId:collegeIdSet){
            College__c college=new College__c();
            college.Id=collegeId;
            college.Count__c=0;
            if(collegeIdToStudentCountMap.containsKey(collegeId)){
					college.Count__c=collegeIdToStudentCountMap.get(collegeId);
            }
            collegeUpdateList.add(college);
        }
        if(collegeUpdateList.size()>0){
            update collegeUpdateList;
        }
        /*if(collegeUpdateMap.size()>0){
            update collegeUpdateMap.values();
        }*/
    }
}
//third way to do this
/*for(College__c college:[SELECT Id,(SELECT Id FROM Students__r)
 								FROM College__c
							WHERE Id IN:collegeIdSet]){
            College__c tempCollege=new College__c();
            tempCollege.Id=college.Id;
            tempCollege.Count__c=college.Students__r.size();
            collegeUpdateList.add(tempCollege);
}
if(collegeUpdateList.size()>0){
update collegeUpdateList;
}*/