@isTest
public class ContactTriggerTest {
    static testmethod void testInsertUnique(){
        List<Contact> contactList=new List<Contact>();
        for(integer i=1;i<=5;i++){
            Contact con=new Contact(); 
            con.FirstName='Contact'+i;
            con.LastName='Contact'+i;
            con.Email='Contact'+i+'@mtxb2b.com';
            con.Birthdate=date.today()-7;
            contactList.add(con);
        }
        
        insert contactList;//it will not add records in database but just tests it
        List<Contact> tempContactList=new List<Contact>();
        tempContactList=[SELECT Id
                         FROM Contact];
        System.assertEquals(5,tempContactList.size());
        
    }//when ever a method ends the data gets destroyed at the end of that method
    static testmethod void testInsertDuplicate(){
        List<Contact> contactList=new List<Contact>();
        for(integer i=1;i<=5;i++){
            Contact con=new Contact(); 
            con.FirstName='Contact'+i;
            con.LastName='Contact'+i;
            con.Email='Contact'+i+'@mtxb2b.com';
            con.Birthdate=date.today()-7;
            contactList.add(con);
        }
        insert contactList;
        Contact con=new Contact(); 
        con.FirstName='Contact1';
        con.LastName='Contact1';
        con.Email='Contact1@mtxb2b.com';
        con.Birthdate=date.today()-7;
        try{
            Test.startTest();
        insert con;
            Test.stopTest();
        }
        catch(Exception e){
            System.assertEquals(true,e.getMessage().contains('Duplicate Contact'));
        }
    }
    
    //test update
    static testmethod void testUpdateConatct(){
        List<Contact> contactList=new List<Contact>();
        for(integer i=1;i<=5;i++){
            Contact con=new Contact(); 
            con.FirstName='Contact'+i;
            con.LastName='Contact'+i;
            con.Email='Contact'+i+'@mtxb2b.com';
            con.Birthdate=date.today()-7;
            contactList.add(con);
        }
        insert contactList;
        Contact con=contactList.get(4);
        con.FirstName='Contact1';
        con.LastName='Contact1';
        con.Email='Contact1@mtxb2b.com';
        try{
            Test.startTest();
            update con;
            Test.stopTest();
        }
        catch(Exception e){
            System.assertEquals(true,e.getMessage().contains('Duplicate Contact'));
        }
            
    }
}
//Test.startTest() ,Test.stopTest() is used to reset all limits
//can be used only once so we create different methods
//used to reduce dml and soql statements as we just apply for update or insert