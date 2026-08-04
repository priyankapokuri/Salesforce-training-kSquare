# Sprint Reflection

## What Worked Well

Creating custom objects and implementing business logic step by step made the complete application flow easier to understand.

Breaking the business transaction into small reusable methods improved readability and maintainability.

---

## Most Interesting Part

Understanding that SOQL is not simply a query language.

It is the mechanism through which software gathers information before making business decisions.

---

## Biggest Challenge

The most challenging part was understanding how multiple Apex methods work together to complete a single business transaction.

It was not the syntax that was difficult—it was understanding the business flow.

---

## Lessons Learned

- Retrieve information before making decisions.
- Validate business rules before modifying data.
- Keep every method focused on one responsibility.
- Never perform DML until all validations succeed.
- Clean code is easier to extend and maintain.

---

## What I Would Improve

If this application were used by thousands of students, I would:

- Add exception handling.
- Create reusable utility classes.
- Add Apex Test Classes.
- Improve validation logic.
- Use constants instead of hardcoded values.
- Add logging and monitoring.

---

## Today I Realised

> Good software does not make assumptions.
>
> It retrieves facts, validates business rules, and changes data only after making informed decisions.

---

## Sprint Summary

This sprint helped me understand how SOQL, DML, and Apex work together to implement real enterprise business transactions.

Instead of writing isolated code, I learned how professional Salesforce developers build maintainable services that solve business problems step by step.

