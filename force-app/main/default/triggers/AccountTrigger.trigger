trigger AccountTrigger on Account (after insert) {
    List<Account> accUpdateList=new List<Account>();
    for(Account acc:Trigger.New){
        System.debug(acc.Id);
        Account obj=new Account();
        obj.Id=acc.Id;
        obj.SLAExpirationDate__c=Date.today()+180;
        accUpdateList.add(obj);
    }
    if(accUpdateList.size()>0)
        update accUpdateList;
}