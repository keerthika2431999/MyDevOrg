public class OpportunityAccountReport {
    public OpportunityAccountReport(){
        List<AccountOpportunityReport__c> accountOpportunityList = new List<AccountOpportunityReport__c>();
        Map<String,Decimal> accountOpportunityRecordsMap = new  Map<String,Decimal>();
        Map<String,Id> accountOpportunityRecordKeyAndIdMap = new Map<String,Id>();
        List<String> monthList= new List<String>{' ','Jan','Feb','March','April','May','June','July','August','September','October','Nov','Dec'};
            for(Opportunity opp: [SELECT Id,AccountId,Account.Name,Account.Active__c,StageName,CloseDate,Amount,Owner.Name
                                  FROM Opportunity
                                  WHERE Account.Active__c='Yes'
                                  AND StageName='Closed Won'
                                  AND CreatedDate=TODAY]){
                                      Integer monthValue=opp.CloseDate.month();
                                      String month = monthList.get(monthValue);
                                      Integer year = opp.CloseDate.year();
                                      String key= opp.Account.Name+'*'+opp.Owner.Name+'*'+month+'*'+year;
                                      if(!accountOpportunityRecordsMap.containsKey(key)){
                                          accountOpportunityRecordsMap.put(key,opp.Amount);
                                      }
                                      else{  Decimal sum =  accountOpportunityRecordsMap.get(key) +opp.Amount;
                                           accountOpportunityRecordsMap.put(key,sum);
                                          }
                                  }
        for(String key: accountOpportunityRecordsMap.keySet()){
            List<String> keyList = key.split('\\*');
            System.debug( keyList.get(0)+' '+ keyList.get(1)+ ' '+ keyList.get(2)+' '+keyList.get(3)+' '+accountOpportunityRecordsMap.get(key));
        }
        for( AccountOpportunityReport__c record : [SELECT Id,Record_Key__c
                                                   FROM AccountOpportunityReport__c
                                                   WHERE Record_Key__c IN :accountOpportunityRecordsMap.keySet()]){
                                                       System.debug(record.Record_Key__c);
                                                       accountOpportunityRecordKeyAndIdMap.put(record.Record_Key__c,record.Id);
                                                   }
        System.debug( accountOpportunityRecordKeyAndIdMap.keySet());
        for(String key :accountOpportunityRecordsMap.keySet()){
            AccountOpportunityReport__c accountOpportunityRecord = new AccountOpportunityReport__c();  
            if(accountOpportunityRecordKeyAndIdMap.containsKey(key)){
                  accountOpportunityRecord.Id=accountOpportunityRecordKeyAndIdMap.get(key);
            }
            List<String> keyList = key.split('\\*');
            accountOpportunityRecord.Record_Key__c=key;
            accountOpportunityRecord.Account_Name__c= keyList.get(0);
            accountOpportunityRecord.Sales_Rep__c= keyList.get(1);
            accountOpportunityRecord.Month__c= keyList.get(2);
            accountOpportunityRecord.Year__c= keyList.get(3);
            accountOpportunityRecord.Total_Business__c= accountOpportunityRecordsMap.get(key);
            accountOpportunityList.add(accountOpportunityRecord);
            System.debug(accountOpportunityRecord.Account_Name__c+' '+accountOpportunityRecord.Sales_Rep__c+' '+ accountOpportunityRecord.Month__c+' '+ accountOpportunityRecord.Year__c+' '+ accountOpportunityRecord.Total_Business__c);
        }
        if(accountOpportunityList.size()>0){
            upsert accountOpportunityList;
        }
    }
}