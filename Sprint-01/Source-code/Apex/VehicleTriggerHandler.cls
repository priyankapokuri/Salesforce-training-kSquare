public class VehicleTriggerHandler {

    public static void handleBeforeInsert(List<Vehicle__c> newVehicles) {

        Set<Id> uniqueIds = new Set<Id>();

        for (Vehicle__c vehicle : newVehicles) {
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

        for (Vehicle__c vehicle : newVehicles) {

            if (vehicle.Dealer__c != null) {

                Account dealer = dealerMap.get(vehicle.Dealer__c);

                System.debug(vehicle.Name + ' -> ' + dealer.Name);
            }
        }
    }
}
