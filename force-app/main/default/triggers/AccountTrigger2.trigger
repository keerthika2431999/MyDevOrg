//before update is used here when the user has a color and the account's owner is changed
trigger AccountTrigger2 on Account (before insert,before update) {
    Set<Id> userIdSet=new Set<Id>();
    Map<Id,String> userIdToColorMap=new Map<Id,String>();
    for(Account acc:Trigger.New){
       if(Trigger.OldMap== null || acc.OwnerId!=Trigger.OldMap.get(acc.Id).OwnerId)//checks if old owner id different 
           //from new ownerId of account and used when we want to update certain records and keep rest of them same,null is used to remove
           //null pointer exception ie, T||T=T it works when we create new record
            {
            userIdSet.add(acc.OwnerId);
        }
		
    }
    for(User u:[SELECT Id,Favourite_Color__c
               FROM User
               WHERE Id IN :userIdSet
               AND Favourite_Color__c!=''])
    {
        userIdToColorMap.put(u.Id,u.Favourite_Color__c);
    }
    for(Account acc:Trigger.New){
        if((Trigger.OldMap== null || acc.OwnerId!=Trigger.OldMap.get(acc.Id).OwnerId) && userIdToColorMap.containsKey(acc.OwnerId)){
            acc.Favourite_Color__c=userIdToColorMap.get(acc.OwnerId);//mapping is done between account and user
        }
    }

}