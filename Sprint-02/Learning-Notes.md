# Learning Notes – Salesforce Developer Bridge Program (Day 2)

## Sprint Objective

The objective of Day 2 was to understand how Salesforce applications process multiple records efficiently while respecting Governor Limits.

The focus was on Apex Collections, Bulkification, Asynchronous Apex, and Lightning Web Component communication.

---

# Topics Covered

## 1. Apex Collections

Collections help manage multiple records efficiently.

### List

A List stores ordered data and allows duplicate values.

Example Uses:

- Store query results.
- Process multiple records.
- Bulk DML operations.

---

### Set

A Set stores unique values only.

Example Uses:

- Remove duplicate IDs.
- Collect unique records.
- Improve query efficiency.

---

### Map

A Map stores data as Key-Value pairs.

Example:

Id → Student Record

Maps allow fast lookup of records without repeatedly querying the database.

---

# 2. Governor Limits

Salesforce is a multi-tenant platform.

To ensure fairness, every transaction must follow platform limits.

Examples:

- Maximum SOQL Queries
- Maximum DML Statements
- CPU Time
- Heap Size

Governor Limits encourage developers to write efficient and scalable code.

---

# 3. Bulkification

Bulkification means writing code that processes many records in a single transaction.

Bad Example:

SOQL inside a loop.

Good Example:

- Query once.
- Store records in a Map or List.
- Process records inside loops.
- Perform DML outside loops.

---

# 4. Asynchronous Apex

Asynchronous Apex executes code in the background.

Topics Learned:

- @future Methods
- Queueable Apex
- Batch Apex

Benefits:

- Faster user experience.
- Long-running processes.
- Callouts.
- Large data processing.

---

# 5. Lightning Web Components Communication

Component Communication Types:

## Parent → Child

Uses:

- @api properties

Purpose:

Parent passes data to child components.

---

## Child → Parent

Uses:

- Custom Events

Purpose:

Child notifies parent when something happens.

---

# Engineering Principles Learned

- Always bulkify Apex code.
- Never place SOQL or DML inside loops.
- Use Collections to improve efficiency.
- Execute long-running tasks asynchronously.
- Build reusable and loosely coupled components.

---

# Key Takeaways

- Lists process collections of records.
- Sets eliminate duplicates.
- Maps provide fast record lookup.
- Bulkification prevents Governor Limit exceptions.
- Asynchronous Apex improves application performance.
- Component communication keeps LWCs modular and reusable.
