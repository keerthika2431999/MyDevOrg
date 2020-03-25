public class SetDemo {
    public SetDemo(){
		Set<String> colorSet=new Set<String>();
        //Add new values use add()
        colorSet.add('Red');
        colorSet.add('Green');
        colorSet.add('Black');
        System.debug('Set Size is '+colorSet.size());
        colorSet.add('Red');
        System.debug('Set Size is '+colorSet.size());
        //values in set are case sensitive
        colorSet.add('RED');
        System.debug('Set Size is '+colorSet.size());
        //To check if set contains a value
        System.debug(colorSet.contains('RED'));
        //iterate on set
        for(String color:colorSet){
            System.debug('value in set '+color);
        }
        //To clear all set values
        colorSet.clear();
        System.debug(colorSet.size());
        
        
        
    }
    public void demoForPrimitiveTypeSet(){
        Account acc1=new Account();
        acc1.Name='Test1';
        insert acc1;
        System.debug('Account is '+acc1);
        Account acc2=new Account();
        acc2.Name='Test2';
        insert acc2;
        System.debug('Account is '+acc2);
        Set<Account> accountSet=new Set<Account>();
        accountSet.add(acc1);
        accountSet.add(acc2);
        System.debug('Values in account is '+accountSet);
        System.debug('Values in account is '+accountSet.size());
        //updating record value of acc1
        acc1.Name='test1';
        update acc1;
        accountSet.add(acc1);
        System.debug('Values in account is '+accountSet);
        System.debug('Values in account is '+accountSet.size());
        acc1.Active__c='Yes';
        update acc1;
        System.debug('Values in account is '+accountSet.contains(acc1));
        delete(acc1);
        delete(acc2);
        
}

}