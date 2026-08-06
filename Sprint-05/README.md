# Placement Management System – Business Logic with Apex

## Project Overview

This sprint focuses on implementing business logic for the Placement Management System using Apex.

Instead of simply storing records, the application now evaluates business rules before processing student applications.

The design follows a service-oriented approach where each Apex class represents a specific business responsibility.

---

# Technologies Used

- Salesforce CRM
- Apex
- SOQL
- DML
- Developer Console

---

# Service Classes

## StudentService

Responsibilities:

- Student registration
- Profile updates
- Academic verification
- Placement status

---

## JobService

Responsibilities:

- Job creation
- Eligibility management
- Job publishing
- Closing expired jobs

---

## ApplicationService

Responsibilities:

- Receive applications
- Prevent duplicate applications
- Validate eligibility
- Save applications
- Return meaningful feedback

---

# Business Workflow

```
Student
    │
    ▼
Lightning Web Component
    │
    ▼
ApplicationService
    │
    ▼
Eligibility Validation
    │
    ▼
Salesforce Database
    │
    ▼
Confirmation Message
```

---

# User Stories Implemented

- Accept student applications.
- Prevent duplicate applications.
- Validate eligibility.
- Save successful applications.
- Display meaningful feedback.

---

# Engineering Principles

- One Responsibility per Service.
- Business Logic before Database Operations.
- Build Incrementally.
- Clear Method Names.
- Maintainable Architecture.

---

# Learning Outcomes

After completing this sprint I understood:

- The importance of business logic.
- How business responsibilities become Apex classes.
- Why methods should represent business activities.
- How parameters support business operations.
- Why architecture should be designed before implementation.
