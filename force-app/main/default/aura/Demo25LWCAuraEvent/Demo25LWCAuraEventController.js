({
    doInit : function(component, event, helper) {
        var contactList=[
            {id:'1',name:'sai',email:'sai1@gmail.com'},
            {id:'2',name:'sai',email:'sai1@gmail.com'},
            {id:'3',name:'sai',email:'sai1@gmail.com'},
            {id:'4',name:'sai',email:'sai1@gmail.com'},
        ];
        component.set('v.contactInfoList',contactList);
    } ,
    contactClickHandler : function(component, event, helper) {
        component.set('v.selectedContactName',event.getParam('name'));
        }
})