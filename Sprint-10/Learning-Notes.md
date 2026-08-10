# Sprint 10 – Reflection

## Overview

Sprint 9 helped me understand how Lightning Web Components connect the Salesforce user interface with the Apex and Service Layer developed in previous sprints.

The sprint moved my learning from basic LWC components to practical, interactive business workflows.

---

## Key Reflection

I learned that an LWC is not just a user interface component. It can communicate with Salesforce data, Apex classes, and other components to create complete business workflows.

Working with the Eligible Jobs and Apply Job functionality helped me understand how a user's action can travel from the UI through Apex and the Service Layer before updating the Salesforce database.

I also learned the difference between Wire Service and Imperative Apex and when each approach is appropriate.

---

## Practical Learning

During this sprint, I:

- Built and worked with Lightning Web Components.
- Practiced HTML, JavaScript, and Metadata configuration.
- Implemented data binding.
- Handled user events.
- Worked with Lightning Data Service.
- Used Wire Service for data retrieval.
- Integrated LWC with Apex.
- Implemented Imperative Apex.
- Built the Eligible Jobs workflow.
- Implemented the Apply Job workflow.
- Practiced Parent-to-Child communication.
- Practiced Child-to-Parent communication using Custom Events.
- Handled loading, success, empty, and error states.
- Refreshed UI data after record operations.
- Debugged LWC and Apex integration issues.

---

## Architecture Understanding

The sprint helped me understand the complete application flow:

```text
User
 ↓
LWC
 ↓
Apex
 ↓
Service Layer
 ↓
Business Logic
 ↓
SOQL / DML
 ↓
Salesforce Database
