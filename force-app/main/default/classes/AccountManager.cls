public with sharing class AccountManager {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(){
        return [SELECT Id,Name,Phone FROM Account Limit 5];
    }
    @AuraEnabled
    public static List<Account> getAccountImperative(Integer totalRecords){
        return [SELECT Id,Name,Phone FROM Account Limit :totalRecords];
    }

}
