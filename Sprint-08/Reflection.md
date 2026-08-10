# Sprint 8 – Reflection

## Overview

Sprint 7 helped me understand how Salesforce Apex should be designed to handle multiple records efficiently while staying within Governor Limits.

The practical implementation made the difference between normal Apex processing and bulk-safe processing clear.

## Key Reflection

I learned that Salesforce applications must always be designed with bulk processing in mind. Using Lists, Sets, and Maps allows multiple records to be processed efficiently instead of performing repeated database operations.

I also understood why SOQL and DML operations should not be placed inside loops. Bulk SOQL and DML reduce the number of database operations and help applications remain within Salesforce Governor Limits.

Working with Trigger Context Variables and the Trigger Handler Pattern also improved my understanding of clean and maintainable Trigger architecture.

## Practical Learning

During this sprint, I:

- Implemented bulk-safe Apex logic.
- Used Sets to collect unique record IDs.
- Used Maps for efficient record lookup.
- Performed bulk SOQL queries.
- Performed bulk DML operations.
- Removed SOQL and DML operations from loops.
- Tested both single and multiple record scenarios.

## Final Reflection

Sprint 7 improved my ability to think about **scalability, performance, and Governor Limits** while writing Apex.

I now understand that Apex code should not only work for one record but should also work correctly and efficiently when many records are processed at the same time.
