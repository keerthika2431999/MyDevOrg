trigger ContactTrigger on Contact (before insert) {
	System.debug('Contact >>>'+Trigger.new);
    System.debug('Contact >>>'+Trigger.old);
}