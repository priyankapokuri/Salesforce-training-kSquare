# Day 11 – LWC Architecture

## Overview

This sprint focused on building scalable Lightning Web Component applications through component communication, forms, Lightning Data Service, reactive data, and reusable components.

## Topics Covered

- Parent-to-child communication using `@api`
- Child-to-parent communication using Custom Events
- Event contracts and `detail`
- Lightning Base Components
- Client-side and server-side validation
- Lightning Data Service (LDS)
- Reactive data and refresh behaviour
- Loading, success, empty, and error states
- Reusable component design
- Avoiding God Components

## Application Architecture

```text
StudentPortal
├── StudentSummary
├── StudentProfile
├── EligibleJobs
│   └── JobCard
├── MyApplications
│   └── ApplicationCard
└── OfferSummary
    └── StatusBadge
