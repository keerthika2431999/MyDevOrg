public class ContactTriggerHandler {
    public static void preventDuplicates(List<Contact> newList, Map<Id,Contact> oldMap){
        Set<String> firstNameSet=new Set<String>();
        Set<String> lastNameSet=new Set<String>();
        Set<String> emailSet=new Set<String>();
        Set<date> dateSet=new Set<date>();
        Set<String> allContactSet=new Set<String>();
        
        for(Contact con: newList){
            if(oldMap == null || con.FirstName != oldMap.get(con.Id).FirstName || con.LastName != oldMap.get(con.Id).LastName || con.Email!=oldMap.get(con.Id).Email || con.BirthDate!=oldMap.get(con.Id).BirthDate )
            {
                firstNameSet.add(con.FirstName);
                lastNameSet.add(con.LastName);
                emailSet.add(con.Email);
                dateSet.add(con.Birthdate);
            }
        }
        if(firstNameSet.size()>0){
        for(Contact con:[SELECT Id,FirstName,LastName,Email,Birthdate 
                         FROM Contact
                         WHERE FirstName IN :firstNameSet
                         AND  LastName IN :lastNameSet
                         AND Birthdate IN :dateSet
                         AND Email IN :emailSet]){
                             String uniqueContact=con.FirstName+con.LastName+con.Email+String.valueOf(con.Birthdate);
                             allContactSet.add(uniqueContact.toLowerCase());//already existing contacts
                         }
        }
        for(Contact con:newList)
        {
            if(oldMap == null || con.FirstName != oldMap.get(con.Id).FirstName || con.LastName != oldMap.get(con.Id).LastName || con.Email!=oldMap.get(con.Id).Email || con.BirthDate!=oldMap.get(con.Id).BirthDate )
            {
                   String contactString= con.FirstName+con.LastName+con.Email+String.valueOf(con.Birthdate);
                   if(allContactSet.contains(contactString.toLowerCase()))
                   {
                       con.addError('Duplicate Contact');
                   }
                   else{
                       allContactSet.add(contactString.toLowerCase());
                   }
               }
        }
    }
}