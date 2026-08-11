trigger VehicleTrigger on Vehicle__c (before insert) {

    Set<Id> uniqueIds = new Set<Id>();

    for (Vehicle__c vehicle : Trigger.new) {
        if (vehicle.Dealer__c != null) {
            uniqueIds.add(vehicle.Dealer__c);
        }
    }

    List<Account> dealers = [
        SELECT Id, Name
        FROM Account
        WHERE Id IN :uniqueIds
    ];

    Map<Id, Account> dealerMap = new Map<Id, Account>(dealers);

    for (Vehicle__c vehicle : Trigger.new) {

        if (vehicle.Dealer__c != null) {

            Account dealer = dealerMap.get(vehicle.Dealer__c);

            System.debug(vehicle.Name + ' -> ' + dealer.Name);
        }
    }
}

/* Execute Anonymous */

Account acc = [SELECT Id FROM Account LIMIT 1];

List<Vehicle__c> vehicles = new List<Vehicle__c>();

for (Integer i = 1; i <= 5; i++) {

    vehicles.add(new Vehicle__c(
        Name = 'Vehicle ' + i,
        Dealer__c = acc.Id
    ));
}

insert vehicles;
