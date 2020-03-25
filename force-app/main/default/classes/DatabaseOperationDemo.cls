public class DatabaseOperationDemo {
    public void printHello(){
        System.debug('Hello');
    }
    public void createSingleRecord(){
    Account acc=new Account();
        acc.Name='Test Apex';
        acc.Active__c='Yes';
        insert acc;
        System.debug('Id is '+acc.Id);
        
    }
    public void createMultipleRecords(){
        //List<objectname> variable=new List<objectname>()
        List<Account> accountInsertList=new List<Account>();
        for(integer count=0; count<200; count++){
            	Account acc=new Account();
            acc.Name='Test Apex'+count;
            accountInsertList.add(acc);
		}
        if(accountInsertList.size()>0){
			insert accountInsertList;
        }
        
       /* for(Integer count=0;count<151;count++){
            Account acc=new Account();
        	acc.Name='Test Apex'+count;
        	acc.Active__c='Yes';
        	insert acc;
        	System.debug('Id of count '+ count +' is '+acc.Id);
        }Too many dml 151*/
        
    }
    public void updateRecords(){
    //we write query first which returns list for updation
        List<Account> accountList=new List<Account>();
        accountList=[SELECT Id,Name,Active__c,CreatedDate,Type,Industry,OwnerId,LastModifiedById,CreatedById,
                     Owner.Name,Owner.Email
                    FROM Account
                    WHERE CreatedDate=Today
                    AND Name LIKE 'Test Apex%'
                    ORDER BY Name];
        for(Account acc: accountList)
        {
            acc.Active__c='No';
        }
        if(accountList.size()>0){
				update accountList;
        }
        
   }
    //another method to update
    public void updateRecords2()
    {
        List<Account> accountList=new List<Account>();
        for(Account acc:[SELECT Id,Active__c
                        From Account
                        WHERE CreatedDate=Today
                    	AND Name LIKE 'Test Apex%'
                         ORDER BY Name]){
                             acc.Active__c='Yes';
                             accountList.add(acc);
                         }
        if(accountList.size()>0){
			update accountList;
        }
    }
    
    //reading
    public void readRecords(){
        /*for(Integer i=0;i<101;i++){
            List<Account> accountList=new List<Account>();
            accountList=[SELECT Id,Name FROM Account];
        }*/
        for(Account acc:[SELECT Id,Active__c,Name
                        From Account
                        WHERE CreatedDate=Today
                    	AND Name LIKE 'Test Apex%'
                         ORDER BY Name])
          {
            System.debug(acc.Name);
           }
    }
    //deleting
    public void deleteRecords()
    {
        List<Account> accountList=new List<Account>();
        accountList=[SELECT Id,Active__c,Name
                        From Account
                        WHERE CreatedDate=Today
                    	AND Name LIKE 'Test Apex%'
                         ORDER BY Name];
        if(accountList.size()>0){
           delete accountList; 
        }
        
    }
}