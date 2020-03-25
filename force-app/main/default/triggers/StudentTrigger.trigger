//rollup summary
trigger StudentTrigger on Student__c (after insert,after update,after delete,after undelete) {
			StudentTriggerHandler.countStudent(Trigger.new,Trigger.oldMap);
    //System.debug('before' +Trigger.oldMap);
    //System.debug('after' +Trigger.oldMap);
}