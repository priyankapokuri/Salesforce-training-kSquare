trigger vehicleTrigger on Vehicle__c (before insert) {
    Account acc = [
            SELECT Id, Name
            FROM Account
            LIMIT 1
        ];
    for(Vehicle__c vehicle: Trigger.new){
        System.debug(acc.Name);
    }
}
