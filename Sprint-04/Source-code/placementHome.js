import { LightningElement } from 'lwc';

export default class PlacementHome extends LightningElement {
    studentName = 'Anya';
    studentId = '1225';
    studentDepartment = 'Information Technology';
    message = '';

    showMessage() {
        this.message = 'Welcome to Salesforce Development';
    }
    status = 'Not Applied';

    changeStatus() {
        this.status = 'Applied';
    }
     todayDate = '31 July 2026';

    companies = 25;

    jobs = 63;

    applications = 5;
}
