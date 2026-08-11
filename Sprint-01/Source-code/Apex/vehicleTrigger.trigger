trigger VehicleTrigger on Vehicle__c (before insert) {

    if (Trigger.isBefore && Trigger.isInsert) {
        VehicleTriggerHandler.handleBeforeInsert(Trigger.new);
    }

}
