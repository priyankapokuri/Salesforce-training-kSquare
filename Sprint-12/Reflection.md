# Sprint 12 – Reflection

## Overview

Sprint 11 helped me understand how Salesforce applications communicate with external systems using APIs and integration patterns.

The sprint focused on REST APIs, Apex HTTP Callouts, Queueable Apex, Named Credentials, authentication, error handling, retry mechanisms, idempotency, Salesforce Connect, External Objects, and integration architecture.

---

## What I Learned

I learned that an API is a communication contract between two independent software systems. I understood how REST APIs use HTTP methods such as GET, POST, PUT, PATCH, and DELETE to perform different operations.

I also learned how API requests and responses are structured using URLs, HTTP methods, headers, authentication information, request bodies, status codes, and response bodies.

---

## Salesforce Integration

I understood how Salesforce can communicate with external systems using Apex HTTP Callouts.

The overall architecture is:

```text
Trigger
   ↓
Service
   ↓
Queueable Apex
   ↓
Named Credential
   ↓
REST API
   ↓
External System
