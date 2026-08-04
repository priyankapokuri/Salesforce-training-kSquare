
# Learning Notes – Enterprise Business Transactions with SOQL, DML & Apex

## Sprint Objective

The objective of this sprint was to understand how Salesforce developers build complete business transactions by combining SOQL, DML, and Apex.

Instead of learning individual concepts, I learned how different methods work together to solve a real business problem.

---

# Business Scenario

A student applies for a placement opportunity.

Before creating the application, the system must:

1. Retrieve Student information.
2. Retrieve Job eligibility criteria.
3. Check whether the student has already applied.
4. Validate eligibility.
5. Create the application.
6. Update application status after recruiter action.

---

# Concepts Learned

## SOQL (Salesforce Object Query Language)

SOQL is used to retrieve records from Salesforce.

Example:

```apex
SELECT Name, CGPA__c, Branch__c
FROM Student__c
WHERE Id = :studentId
```
