# Learning Notes – Salesforce Interview Readiness Bootcamp (Day 4)

## Objective

The objective of today's assignment was to understand the fundamentals of Lightning Web Components (LWC) and build the first user interface for the Placement Management System.

Unlike previous days, which focused on backend development using Apex, SOQL, Triggers, and Flows, today focused on building the presentation layer that users interact with.

---

# Topics Covered

## What is Lightning Web Components (LWC)?

Lightning Web Components (LWC) is Salesforce's modern UI framework built on standard web technologies such as HTML, JavaScript, and CSS.

LWC enables developers to create fast, reusable, secure, and maintainable user interfaces that integrate seamlessly with Salesforce data.

---

## LWC Architecture

A Salesforce application follows this architecture:

```
User
   │
   ▼
Lightning Web Component (UI)
   │
   ▼
Apex Classes
   │
   ▼
SOQL
   │
   ▼
Salesforce Database
```

Today, the focus was on building the top layer of this architecture.

---

## Files in an LWC

Every Lightning Web Component consists of three essential files:

### HTML File

Responsibilities:

- Page Layout
- Headings
- Buttons
- Text
- Images

Example:

```
placementHome.html
```

---

### JavaScript File

Responsibilities:

- Variables
- Business Logic
- Event Handling
- Data Binding

Example:

```
placementHome.js
```

---

### Meta XML File

Responsibilities:

- Makes the component available in Lightning App Builder.
- Defines where the component can be used.

Example:

```
placementHome.js-meta.xml
```

---

## Concepts Practiced

### Data Binding

Variables declared in JavaScript can be displayed dynamically inside HTML using curly braces.

Example:

```html
<p>Hello {studentName}</p>
```

Whenever the variable changes, the UI updates automatically.

---

### Event Handling

Buttons can execute JavaScript methods when clicked.

Example:

- Display Welcome Message
- Change Application Status

---

## Mini Project Enhancement

Created the first screen of the Placement Management System displaying:

- Placement Portal
- Today's Date
- Welcome Student
- Number of Companies
- Number of Jobs
- Applications Submitted

The values were hard-coded to understand UI development before connecting to Apex.

---

# Engineering Principles Learned

- Separate UI from business logic.
- Keep JavaScript responsible for behavior.
- Keep HTML responsible for presentation.
- Build reusable components.
- Prepare components for future Apex integration.

---

# Key Takeaways

- LWC is Salesforce's modern UI framework.
- HTML defines the interface.
- JavaScript controls behavior.
- Meta XML exposes the component.
- Data binding automatically updates the UI.
- LWC interacts with Apex instead of directly querying Salesforce.
