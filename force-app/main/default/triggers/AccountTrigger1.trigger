trigger AccountTrigger1 on Account (after insert) {
    List<Contact> contactList=new List<Contact>();
    for(Account acc:Trigger.new){
        Contact con=new Contact();
        con.LastName=acc.Name;
        con.AccountId=acc.Id;
        contactList.add(con);
    }
    insert contactList;
}