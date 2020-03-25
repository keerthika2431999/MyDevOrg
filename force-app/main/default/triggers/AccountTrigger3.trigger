//1 trigger 1 handler
trigger AccountTrigger3 on Account (after insert ,after update, before insert, before update) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate) && StaticConstants.runAccountTrigger)//insert and update after trigger
    {
        AccountTriggerHandler.updateSLAExpirationDate(Trigger.new, Trigger.oldMap, Trigger.newMap);
    }
    /*if(Trigger.isBefore && Trigger.isInsert)//for inserting billing address,isBefore is used as we are updating the same record
    {
		AccountTriggerHandler.copyBillingtoShipping(Trigger.new);
    }*/
    if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isInsert)){
        AccountTriggerHandler.copyBillingtoShippingOnUpdate(Trigger.new,Trigger.oldMap);
    }
    
}