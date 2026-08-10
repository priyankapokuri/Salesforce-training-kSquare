# Day 10 – Learning Notes

## LWC Component Architecture

- LWC applications should use focused, reusable components.
- Avoid large "God Components" with too much state and logic.
- Each component should have a clear responsibility.

## Component Communication

### Parent → Child
- Use `@api` properties to pass data from parent to child.

### Child → Parent
- Use Custom Events to communicate actions or information.
- The child reports the event; the parent decides what to do.

## Custom Events

- Events should communicate accurate facts.
- Distinguish between user intent and business outcomes.
- Use `detail` to pass only the required information.

## Forms and Validation

- Use Salesforce Lightning Base Components such as `lightning-input` and `lightning-combobox`.
- Client-side validation improves user experience.
- Server-side validation must enforce business rules.

## Lightning Data Service

- Use LDS for supported Salesforce record operations when custom Apex is unnecessary.
- Choose LDS or Apex based on the requirement.

## Reactive Data

- Data ownership should be clear.
- Components must refresh when dependent data changes.
- Avoid maintaining conflicting copies of the same data.

## Reusable Components

Examples:
- `JobCard`
- `StatusBadge`
- `EmptyState`
- `LoadingIndicator`

Reusable components should provide meaningful functionality without unnecessary abstraction.

## Key Principle

> Components should have clear responsibilities and communicate through clear contracts.
