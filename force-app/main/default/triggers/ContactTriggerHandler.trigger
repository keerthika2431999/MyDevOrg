trigger ContactTriggerHandler on Contact (before insert,before update) {
		ContactTriggerHandler.preventDuplicates(Trigger.new ,Trigger.oldMap);
}