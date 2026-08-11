Vehicle__c vehicle = [
    SELECT Id
    FROM Vehicle__c
    LIMIT 1
];

VehicleFutureHandler.updateCustomerName(vehicle.Id);
