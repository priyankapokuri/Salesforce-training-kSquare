# Learning Notes – Chapter 5: Building Business Logic with Apex

## Sprint Objective

The objective of this sprint was to understand how enterprise software makes business decisions instead of simply storing data.

Rather than focusing on Apex syntax, this sprint emphasized understanding business requirements, identifying business rules, designing service classes, and implementing business logic incrementally.

---

# What is Business Logic?

Business logic is the intelligence of an application.

It allows software to make decisions based on business requirements before storing or modifying data.

Example business decisions:

- Reject duplicate applications.
- Validate student eligibility.
- Prevent applications after the deadline.
- Check backlog criteria.
- Verify branch eligibility.

Without business logic, software only stores information and cannot assist users in making correct decisions.

---

# Business Rules

Business rules define how the software should behave.

Examples:

- Students should not apply after the deadline.
- Duplicate applications are not allowed.
- Companies define eligibility criteria.
- Recruiters should receive notifications.
- Accurate data must be maintained.

Business rules describe *what* the software should do before deciding *how* it will be implemented.

---

# Business Responsibilities

Software should be organized according to business responsibilities.

## StudentService

Responsible for:

- Registering students
- Updating student profiles
- Verifying academic information
- Checking placement status

---

## JobService

Responsible for:

- Creating job postings
- Updating eligibility criteria
- Closing expired jobs
- Publishing opportunities

---

## ApplicationService

Responsible for:

- Receiving applications
- Validating eligibility
- Preventing duplicate applications
- Saving applications
- Returning meaningful feedback

---

# Designing Apex Classes

An Apex class represents a business responsibility.

Instead of asking:

"What code should I write?"

Ask:

"Which business responsibility does this class represent?"

---

# Methods

Methods represent business activities.

Example:

```apex
public void submitApplication(Id studentId, Id jobId)
```

The method should clearly communicate:

- What it does.
- What information it needs.
- What result it produces.

---

# Parameters

Parameters provide the information required to complete a business activity.

Example:

- Student Id
- Job Id

Only required information should be passed.

---

# Returning Results

Every business activity should communicate its outcome.

Possible results:

- Application submitted successfully.
- Duplicate application detected.
- Eligibility criteria not satisfied.
- Application deadline expired.

Users should always receive meaningful feedback.

---

# Engineering Principles Learned

- Understand the business before writing code.
- One service should have one responsibility.
- One method should solve one problem.
- Build software incrementally.
- Good architecture reduces future maintenance.
- Good method names improve readability.
- Business logic belongs in service classes.

---

# Key Takeaways

- Business logic gives intelligence to software.
- Apex classes represent business responsibilities.
- Methods represent business activities.
- Parameters represent business information.
- Technology follows understanding, not the other way around.
