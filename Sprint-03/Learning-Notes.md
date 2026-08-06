# Learning Notes – Salesforce Interview Readiness Bootcamp (Day 3)

## Objective

The objective of today's assignment was to understand Salesforce automation tools and learn how to select the appropriate solution based on business requirements.

Instead of relying only on Apex, I learned how to use Validation Rules, Record-Triggered Flows, and Apex Triggers together to build efficient and maintainable Salesforce applications.

---

# Topics Covered

## 1. Validation Rules

Validation Rules ensure that invalid data cannot be saved in Salesforce.

Characteristics:

- Execute before records are committed.
- Display meaningful error messages.
- Improve data quality.
- Cannot update field values.

Examples implemented:

- Student CGPA must satisfy eligibility requirements.
- Application Date cannot be after the Job Closing Date.
- Mandatory fields cannot be left blank.

---

## 2. Flow Builder

Flow Builder is Salesforce's declarative automation tool used to automate business processes with little or no code.

Types of Flows learned:

- Record-Triggered Flow
- Before-Save Flow
- After-Save Flow

Implemented Flow:

- Automatically populate Application Date.
- Send email notification to the Placement Officer.
- Automatically create an Offer Letter record when the Application Status becomes "Selected".

---

## 3. Apex Trigger

Triggers execute automatically when records are inserted, updated, or deleted.

Responsibilities:

- Handle complex business logic.
- Validate duplicate applications.
- Process requirements that are difficult to implement declaratively.

Business logic remains inside Service classes to maintain clean architecture.

---

## Choosing the Right Automation Tool

| Requirement | Solution |
|------------|----------|
| Auto-fill Application Date | Record-Triggered Flow |
| Send Email Notification | Flow |
| Reject Duplicate Applications | Apex Trigger |
| Validate Low CGPA | Validation Rule / Apex |
| Create Offer Letter | Flow |

---

## Execution Order

Understanding the execution order is important to avoid automation conflicts.

General order:

1. Validation Rules
2. Before-Save Flow
3. Before Trigger
4. Database Save
5. After Trigger
6. After-Save Flow

---

# Engineering Principles Learned

- Use declarative tools whenever possible.
- Write Apex only when declarative automation cannot solve the requirement.
- Keep business logic separated from automation.
- Build reusable and maintainable solutions.
- Avoid duplicate automation.

---

# Key Takeaways

- Validation Rules improve data quality.
- Flows automate business processes without code.
- Apex handles complex business logic.
- Choosing the right automation tool is an important Salesforce developer skill.
- Clean architecture improves scalability and maintainability.
