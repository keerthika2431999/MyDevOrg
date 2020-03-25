public class UpdateAccountActiveField {
    public UpdateAccountActiveField(){
        List<Account> accountUpdateList=new List<Account>();
        Set<Id> accountIdSet=new Set<Id>();
        
        for(Contact con:[SELECT Id,AccountId FROM Contact 
                        WHERE LastName='Test'
                         AND CreatedDate=TODAY]){
                             Account acc=new Account();
                             acc.Id=con.AccountId;
                             acc.Active__c='Yes';
                             if(!accountIdSet.contains(acc.Id)){
                               accountUpdateList.add(acc);  
                               accountIdSet.add(acc.Id);	
                             }
                         }
        if(accountUpdateList.size()>0)
        {
					update accountUpdateList;
        }
    }
    public void updateSLAExpirationDate()
    {
        List<Account> accountUpdateList=new List<Account>();
        Set<Id> accountIdSet=new Set<Id>();
        for(Contact con:[SELECT Id,AccountId FROM Contact 
                        WHERE LastName='Test'
                         AND CreatedDate=TODAY])
        {
           accountIdSet.add(con.AccountId); 
        }//END OF FOR
        if(accountIdSet.size()>0){
        for(Account acc:[SELECT Id,Active__c,SLAExpirationDate__c
                        FROM Account
                        WHERE Id IN :accountIdSet])//add colon when we want to take values dynamically from a set
        {
            acc.Active__c='No';
            if(acc.SLAExpirationDate__c==NULL){
                acc.SLAExpirationDate__c=Date.today().addDays(90);
			}//end of if
            else{
                acc.SLAExpirationDate__c=acc.SLAExpirationDate__c.addDays(90);
				}//end of else
            accountUpdateList.add(acc);
        }//END OF FOR
       }//END OF IF
        if(accountUpdateList.size()>0){
            update accountUpdateList;
        }
    }//END OF THIS METHOD
    public void updateAccountUsingMap(){
        //keys are primitive(string,id,integer) and values can be anything primitive/obj
        Map<Id,Account> accountIdtoRecordMap=new  Map<Id,Account>();
         for(Contact con:[SELECT Id,AccountId FROM Contact 
                        WHERE LastName='Test'
                         AND CreatedDate=TODAY])
         {
			Account acc=new Account();
            acc.Id=con.AccountId;
             acc.Active__c='Yes';
             accountIdtoRecordMap.put(acc.Id,acc);
         }//END OF FOR
        if(accountIdtoRecordMap.size()>0){
            List<Account> accountUpdateList=accountIdtoRecordMap.values();
			update accountUpdateList;
        }
    }//END OF THIS METHOD
    
}