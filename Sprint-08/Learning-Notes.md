# Sprint 8 – Learning Notes

## Governor Limits

Salesforce uses Governor Limits to control the resources consumed by Apex code in a shared environment.

Important limits include:

- SOQL Query Limits
- DML Statement Limits
- CPU Time
- Heap Size

Apex code must be designed to work within these limits.

---

## Bulkification

Bulkification means writing Apex code that can process multiple records efficiently in a single transaction.

Instead of processing records individually, collections are used to process groups of records.

### Non-Bulkified Approach

```text
For each record
    ├── Query database
    └── Update database
