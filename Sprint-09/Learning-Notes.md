# Sprint 9 – Learning Notes

## Synchronous vs Asynchronous Apex

### Synchronous Processing

Synchronous Apex executes immediately as part of the user's transaction.

```text
User Action
    │
    ▼
Apex Processing
    │
    ▼
Database Operation
    │
    ▼
Response to User
