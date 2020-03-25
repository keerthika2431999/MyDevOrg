public class MapDemo {
    public MapDemo(){
        //keys(unique) are returned as set and values(duplicate) are returned as list
        Map<String,String> colorMap=new Map<String,String>();
        //Add values to Map
        colorMap.put('red','Red Value');
        colorMap.put('green','Green Value');
        //Print size of map
        System.debug('size '+colorMap.size());
        //Map keys are case sensitive
        colorMap.put('RED','Red Value');
         System.debug('size '+colorMap.size());
        //passing the same key in put update the value
        colorMap.put('RED','new Value');
        String value=colorMap.get('RED');
        System.debug(value);
        //check if map contains key or not
        System.debug(colorMap.containsKey('red'));
        //map return all keys in form of set
        Set<String> colorSet= colorMap.keySet();
        System.debug(colorSet);
        System.debug(colorSet.size());
        //map returns all values in form of list(duplicate values)
        List<String> colorList=colorMap.values();
         System.debug(colorList);
        System.debug(colorList.size());
        //to iterate over map, we iterate over keys and get the values
        //colorMap.keySet() iterates over set
        for(String key:colorMap.keySet()){
            System.debug(colorMap.get(key));
			}
        colorMap.clear();
       }//end of constructor
    public void getAccountIdtoContactMap(){
        //we iterate on keys for map
        //apex program to create map of accountid as key and associated contacts as values
        //query on account and get contacts
        //for contacts: account->f & r->account name-> contacts
        Map<Id,List<Contact>> accountIdtoContactMap = new Map<Id,List<Contact>>();
        for(Account acc:[SELECT Id,Name,(SELECT Id,Name 
                        FROM Contacts)
                        FROM Account
                        WHERE createdDate=TODAY]){
                            accountIdtoContactMap.put(acc.Id,acc.Contacts);//acc.contacts is the child, list of contacts 
                         }
        for(Id accountId:accountIdtoContactMap.keySet()){
          String contactString='';
            //gives contacts in form of list
            for(Contact con:accountIdtoContactMap.get(accountId)){
               contactString=contactString+'>>>>'+ con.Id+'>>>>'+con.Name;
                
            }
            System.debug('For key>>> '+accountId+'>>>>'+contactString);
        }
    }//end of method
}