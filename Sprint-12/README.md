# Sprint 12 – Salesforce Integration

## Overview

Sprint 11 focuses on integrating Salesforce with external systems using REST APIs, Apex Callouts, Named Credentials, and asynchronous processing.

## Topics Covered

- REST APIs and HTTP Methods
- JSON Request and Response
- Apex HTTP Callouts
- Queueable Apex
- Named Credentials
- Authentication vs Authorisation
- Salesforce Connect & External Objects
- Point-to-Point vs Middleware Integration
- Synchronous vs Asynchronous Integration
- Error Handling, Retry & Idempotency

## Mini Project

### External Recruitment Integration

When a student's application becomes **Selected**, Salesforce sends the candidate information to an external recruitment system.

```text
Application Selected
        ↓
Trigger / Service
        ↓
Queueable Apex
        ↓
Named Credential
        ↓
REST API
        ↓
External Recruitment System
