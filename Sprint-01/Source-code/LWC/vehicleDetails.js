import { LightningElement, wire } from 'lwc';
import getVehicles from '@salesforce/apex/VehicleController.getVehicles';

export default class VehicleDetails extends LightningElement {
    @wire(getVehicles)
    vehicles;
}
