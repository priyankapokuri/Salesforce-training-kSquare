# Sprint Reflection

## What Worked Well

Understanding Triggers as business events instead of Apex code completely changed my perspective on Salesforce automation.

---

## Most Interesting Part

Learning that a Trigger should not contain business logic.

Instead, it should delegate responsibilities to Service classes.

---

## Biggest Challenge

The biggest challenge was understanding the separation of responsibilities between Triggers and Services.

---

## Lessons Learned

- Triggers should remain short.
- Services should contain business logic.
- One Trigger per Object.
- Enterprise software grows through reusable components.
- Clean architecture reduces future maintenance.

---

## Future Improvements

If this application were used by multiple universities, I would introduce:

- StatisticsService
- NotificationService
- AlumniService
- InternshipService
- AuditService

without modifying the existing Trigger.

---

## Today I Realised

> Small Triggers often represent well-designed enterprise systems because they delegate work instead of performing it.

---

## Sprint Summary

This sprint helped me understand that Triggers are event coordinators, not business processors.

A clean Trigger architecture allows software to grow without becoming difficult to maintain.
