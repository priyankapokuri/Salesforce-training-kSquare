
### `reflection.md`

```md
# Sprint 8 – Reflection

## Overview

Sprint 8 helped me understand how Salesforce handles operations that do not need to be completed during the user's immediate transaction.

Through practical implementation of different asynchronous Apex approaches, I learned how to select the appropriate execution model based on the type, volume, and timing of the business requirement.

---

## Key Reflection

I learned that not every operation should be performed synchronously. Operations such as notifications, external synchronization, large-volume processing, and recurring maintenance tasks can be moved to background execution.

Queueable Apex helped me understand how structured background jobs can be created and chained. Batch Apex demonstrated how Salesforce can process large datasets in smaller execution units, while Scheduled Apex showed how business operations can be automated based on time.

I also understood that asynchronous processing introduces additional considerations such as job monitoring, duplicate execution, failure handling, and Governor Limits.

---

## Practical Learning

During this sprint, I:

- Implemented Queueable Apex for background processing.
- Passed required record IDs to asynchronous jobs.
- Implemented Queueable job chaining.
- Separated synchronization and notification responsibilities.
- Implemented Batch Apex using `start()`, `execute()`, and `finish()`.
- Processed large datasets in manageable batches.
- Implemented Scheduled Apex for recurring operations.
- Combined Scheduled Apex with Batch Apex.
- Considered idempotency and failure handling.
- Monitored asynchronous job execution.

---

## Final Reflection

Sprint 8 improved my ability to design scalable and responsive Salesforce applications.

I now understand that choosing between synchronous and asynchronous processing depends on the business requirement. I also learned that asynchronous Apex is not simply about moving code to the background; it requires careful design for scalability, reliability, monitoring, and error handling.
