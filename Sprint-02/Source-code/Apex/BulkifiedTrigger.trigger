trigger vehicleTrigger on Vehicle__c (before insert) {
    Account acc = [
        SELECT Id, Name
        FROM Account
        LIMIT 1
    ];

    for (Vehicle__c vehicle : Trigger.new) {
        System.debug(acc.Name);
    }

}

/* Execute Anonymous window */

List<Vehicle__c> vehicles = new List<Vehicle__c>();

for (Integer i = 1; i <= 200; i++) {
    vehicles.add(new Vehicle__c(
        Name = 'Vehicle ' + i
    ));
}

insert vehicles;
