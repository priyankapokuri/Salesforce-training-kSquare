public class VehicleFutureHandler {

    @future
    public static void updateCustomerName(Id vehicleId) {

        Vehicle__c vehicle = [
            SELECT Id, Customer_Name__c
            FROM Vehicle__c
            WHERE Id = :vehicleId
        ];

        vehicle.Customer_Name__c = 'Updated by Future';

        update vehicle;
    }
}
