
# Learning Notes – Salesforce Developer Bridge Program (Day 1)

## Sprint Objective

The objective of Day 1 was to strengthen the core Salesforce development skills required for enterprise application development.

The focus was on understanding data modeling, Apex programming, SOQL queries, Apex Triggers, and Lightning Web Components (LWC).

---

# Topics Covered

## 1. Data Modeling

Data modeling is the foundation of every Salesforce application.

During this task I learned how to:

- Create Custom Objects
- Create Custom Fields
- Design relationships between objects
- Choose between Lookup and Master-Detail relationships

### Key Learning

- Use Lookup when records can exist independently.
- Use Master-Detail when the child record depends on the parent.

---

## 2. Apex Basics

Apex is Salesforce's object-oriented programming language used to implement business logic.

Topics practiced:

- Variables
- Collections
- Classes
- Methods
- Execute Anonymous
- Debug Logs

### Example

```apex
Integer number = 10;
System.debug(number);
```

---

## 3. SOQL

Salesforce Object Query Language (SOQL) is used to retrieve records from Salesforce.

Queries practiced:

- SELECT
- WHERE
- ORDER BY
- LIMIT
- Relationship Queries
- Aggregate Queries
- Comparison Operators

Example:

```sql
SELECT Name
FROM Vehicle__c
WHERE Mileage__c >= 10000
```

---

## 4. Apex Triggers

Triggers execute automatically whenever a record event occurs.

Trigger Events Learned:

- Before Insert
- After Update

### Trigger Responsibilities

- Detect business events.
- Delegate work to Handler classes.
- Keep Trigger logic small and maintainable.

---

## 5. Trigger Handler Pattern

Instead of writing business logic directly inside the Trigger, a separate Handler class was used.

Architecture:

```
Trigger
    │
    ▼
Trigger Handler
    │
    ▼
Business Logic
```

Benefits:

- Cleaner code
- Easier maintenance
- Better scalability
- Improved readability

---

## 6. Lightning Web Components (LWC)

Built a basic Lightning Web Component to display records using @wire.

Concepts Learned:

- Component structure
- HTML
- JavaScript
- Metadata configuration
- @wire decorator
- Lightning App Builder

---

# Engineering Principles Learned

- Design before coding.
- Keep business logic separate from automation.
- Query only required data.
- Build reusable components.
- Think about scalability from the beginning.

---

# Key Takeaways

- Salesforce development combines declarative and programmatic tools.
- Clean architecture is more important than writing long code.
- SOQL retrieves information.
- Apex implements business logic.
- Triggers automate business events.
- LWC provides modern user interfaces.
