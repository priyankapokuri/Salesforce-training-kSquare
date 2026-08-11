# External Recruitment Gateway

## Chapter 12 – Crossing the Salesforce Boundary

### Overview

The **External Recruitment Gateway** is an integration feature in the Placement Management System that connects Salesforce with an external recruitment platform.

When a student's application is marked as **Selected**, Salesforce asynchronously sends the candidate's information to the external recruitment system using a **REST API callout**.

The integration is designed using:

* Apex
* Queueable Apex
* HTTP Callouts
* REST API
* JSON
* Named Credentials
* Error Handling
* Integration Status Tracking
* Retry Strategy
* Idempotency / Duplicate Prevention

---

## 1. Business Problem

The Placement Management System stores student applications and selection information inside Salesforce.

Once a student is selected for a job, the external recruitment platform also needs the candidate's information.

The system should therefore:

1. Detect when an application becomes **Selected**.
2. Prepare the candidate information.
3. Send the information to the external recruitment platform.
4. Process the API response.
5. Record whether the integration succeeded or failed.
6. Store useful error information when the callout fails.
7. Support retry for appropriate temporary failures.
8. Prevent duplicate candidate creation when the same request is processed more than once.

---

## 2. Integration Architecture

The integration follows this architecture:

```text
Application
     |
     | Status = Selected
     v
Application Trigger
     |
     v
Service Layer
     |
     v
Queueable Apex
     |
     v
Named Credential
     |
     v
REST API Callout
     |
     v
External Recruitment Platform
     |
     v
HTTP Response
     |
     +------------------+
     |                  |
     v                  v
  Success             Failure
     |                  |
     v                  v
Integration         Error Handling
Status = Success        |
                        v
                  Integration Status
                        |
                        v
                     Retry
```

### Why Queueable Apex?

The external recruitment system is not required to respond before the Salesforce transaction completes.

Therefore, the integration is processed asynchronously.

This prevents the user's Salesforce operation from being unnecessarily dependent on the external system.

---

# 3. API Contract

## HTTP Method

```text
POST
```

## Endpoint

```text
/candidates
```

The actual external endpoint is configured through a Salesforce Named Credential rather than being hard-coded in Apex.

Example:

```text
callout:Recruitment_API/candidates
```

---

## 4. Request Body

The candidate information sent to the external recruitment platform contains:

* Student Id
* Name
* Email
* Branch
* CGPA
* Job Id
* Company
* Role
* Selection Date

### Example Request

```json
{
    "studentId": "S101",
    "name": "Student Name",
    "email": "student@example.com",
    "branch": "CSE",
    "cgpa": 8.7,
    "jobId": "J101",
    "company": "ABC Technologies",
    "role": "Software Engineer",
    "selectionDate": "2026-08-11"
}
```

The JSON body is generated using Apex JSON serialization rather than manually constructing JSON strings.

---

# 5. Success Response

A successful request may return:

```text
200 OK
```

or

```text
201 Created
```

Example:

```json
{
    "success": true,
    "externalCandidateId": "EXT101"
}
```

When the request succeeds:

```text
Integration Status = Success
```

The external candidate ID can be stored in Salesforce for future reference.

---

# 6. Error Responses

The integration distinguishes different HTTP response codes.

| Status Code | Meaning                          | Action                                 |
| ----------- | -------------------------------- | -------------------------------------- |
| 200         | Successful request               | Mark as Success                        |
| 201         | Resource created                 | Mark as Success                        |
| 204         | Successful response without body | Mark as Success where applicable       |
| 400         | Bad Request                      | Record failure and investigate request |
| 401         | Authentication failure           | Record authentication error            |
| 403         | Forbidden                        | Record authorization/permission error  |
| 404         | Resource not found               | Record failure                         |
| 500         | External server error            | Record failure and consider retry      |

The system should not treat every error as the same type of failure.

---

# 7. Salesforce Components

## Apex Classes

The main Apex components are:

```text
CandidateSyncQueueable.cls
CandidateSyncService.cls
```

If a trigger-handler architecture is being used:

```text
ApplicationTrigger.trigger
ApplicationTriggerHandler.cls
```

### CandidateSyncService

Responsible for business-level integration processing and coordinating the synchronization request.

### CandidateSyncQueueable

Responsible for asynchronous processing and performing the HTTP callout.

The Queueable class implements:

```apex
Queueable
Database.AllowsCallouts
```

---

# 8. Named Credential

The external API connection uses a Salesforce **Named Credential**.

Example:

```text
Recruitment_API
```

Apex references the Named Credential using:

```apex
callout:Recruitment_API
```

### Why use a Named Credential?

Credentials and endpoint configuration should not be hard-coded inside Apex.

This improves:

* Security
* Maintainability
* Configuration management
* Credential rotation
* Separation of configuration from business logic

No passwords, access tokens, API keys, or secrets should be committed to the source code repository.

---

# 9. Authentication and Authorization

### Authentication

Authentication determines:

> Who is making the request?

Examples include credentials or OAuth-based authentication.

### Authorization

Authorization determines:

> What is the authenticated system/user allowed to do?

The integration configuration should ensure that Salesforce has the required permissions to communicate with the external recruitment platform.

---

# 10. Integration Status

The Salesforce application record should maintain the state of the external integration.

### Suggested Field

```text
Integration Status
```

Possible values:

```text
Pending
Success
Failed
Retry
```

### Additional Fields

Recommended fields include:

```text
Integration Error
External Candidate Id
Integration Attempts
```

Example:

```text
Integration Status: Failed

Integration Error:
External server returned HTTP 500.

Integration Attempts:
2
```

This allows administrators to understand what happened without checking Apex debug logs.

---

# 11. Error Handling

The integration should handle both HTTP failures and Apex exceptions.

Example scenarios:

### External API returns 400

```text
Bad Request
```

The request data should be checked.

### External API returns 401

```text
Authentication Failure
```

The Named Credential or authentication configuration should be investigated.

### External API returns 500

```text
External Server Error
```

This may be a temporary failure and can be considered for retry.

### Callout Exception

If the callout throws an exception, the integration should record the failure and preserve useful error information.

---

# 12. Retry Strategy

Temporary failures should be eligible for retry.

Example:

```text
Attempt 1
   |
   v
HTTP 500
   |
   v
Failed
   |
   v
Retry
   |
   v
Attempt 2
   |
   v
HTTP 201
   |
   v
Success
```

Not every failure should automatically be retried.

For example:

```text
401 Authentication Failure
```

should normally be investigated rather than repeatedly sending the same request without fixing authentication.

---

# 13. Idempotency and Duplicate Prevention

An integration request can sometimes be processed more than once.

For example:

```text
Salesforce
   |
   | Request
   v
External System
   |
   | Candidate created
   |
   X Response lost
```

Salesforce may believe the request failed and retry it.

Without duplicate prevention, the external system could create the same candidate twice.

To prevent this, the integration should use a unique business identifier such as:

```text
Application Id
```

or an appropriate external reference / idempotency key.

Example:

```json
{
    "applicationId": "APP001",
    "studentId": "S101",
    "name": "Student Name"
}
```

The external system can use this identifier to determine whether the business transaction has already been processed.

---

# 14. Synchronous vs Asynchronous Processing

This integration uses:

```text
Asynchronous Processing
```

### Reason

The user does not need to wait for the external recruitment platform.

The Salesforce transaction can complete first:

```text
Application → Selected
```

Then:

```text
Queueable Apex
       |
       v
External Recruitment API
```

This separates the core Salesforce business transaction from external communication.

---

# 15. Example End-to-End Flow

### Step 1

A student application exists in Salesforce.

```text
Application Status = Applied
```

### Step 2

The Placement Office changes the application:

```text
Applied → Selected
```

### Step 3

The Salesforce automation detects the status transition.

### Step 4

The integration job is queued.

```apex
System.enqueueJob(
    new CandidateSyncQueueable(applicationId)
);
```

### Step 5

Queueable Apex retrieves the required student, application, and job information.

### Step 6

Apex creates the JSON request.

### Step 7

The request is sent through the Named Credential.

### Step 8

The external recruitment system processes the candidate.

### Step 9

Salesforce receives the HTTP response.

### Step 10

Salesforce updates the integration status.

```text
Success
```

or

```text
Failed
```

---

# 16. Integration Reliability

The integration is designed around the following principles:

### 1. Failure Isolation

Failure of the external recruitment platform should not incorrectly change the actual Salesforce business outcome.

For example:

```text
Student Selection = Selected
```

should remain true even if:

```text
External Integration = Failed
```

These are separate business states.

---

### 2. Observability

The system records:

```text
Integration Status
Integration Error
External Candidate Id
Integration Attempts
```

This gives administrators visibility into the integration.

---

### 3. Retry

Temporary external failures can be retried.

---

### 4. Idempotency

Repeated processing should not create duplicate candidate records.

---

### 5. Secure Configuration

Authentication and endpoint configuration are handled using Named Credentials.

---

# 17. Testing Strategy

The integration should be tested using Apex test classes and mocked HTTP responses.

Important scenarios include:

### Test 1 — Successful Response

```text
HTTP 200
```

Expected:

```text
Integration Status = Success
```

---

### Test 2 — Candidate Created

```text
HTTP 201
```

Expected:

```text
Integration Status = Success
External Candidate Id populated
```

---

### Test 3 — Bad Request

```text
HTTP 400
```

Expected:

```text
Integration Status = Failed
Integration Error populated
```

---

### Test 4 — Authentication Failure

```text
HTTP 401
```

Expected:

```text
Integration Status = Failed
```

---

### Test 5 — Server Error

```text
HTTP 500
```

Expected:

```text
Integration Status = Failed
```

and the request should be eligible for the retry strategy.

---

### Test 6 — Callout Exception

Simulate a callout exception and verify that the integration failure is recorded correctly.

---

### Test 7 — Duplicate Processing

Process the same application more than once and verify that the integration design uses the selected idempotency/business identifier to prevent duplicate business effects.

---

# 18. Project Structure

Recommended Salesforce project structure:

```text
external-recruitment-gateway/
│
├── README.md
│
└── force-app/
    └── main/
        └── default/
            │
            ├── classes/
            │   ├── CandidateSyncQueueable.cls
            │   ├── CandidateSyncQueueable.cls-meta.xml
            │   ├── CandidateSyncService.cls
            │   ├── CandidateSyncService.cls-meta.xml
            │   └── CandidateSyncQueueableTest.cls
            │
            ├── triggers/
            │   ├── ApplicationTrigger.trigger
            │   └── ApplicationTrigger.trigger-meta.xml
            │
            └── objects/
                └── Application__c/
```

The exact object and field API names depend on the Placement Management System implementation.

---

# 19. Engineering Sprints

## Sprint 32 — Basic Integration

### Objective

Build the basic external recruitment integration.

### Tasks

* Define REST API contract
* Define request JSON
* Define response format
* Create Named Credential
* Create Queueable Apex
* Implement HTTP POST callout
* Serialize candidate information into JSON
* Process successful responses
* Process error responses

### Expected Result

```text
Salesforce
    ↓
Queueable Apex
    ↓
Named Credential
    ↓
REST API
    ↓
External Recruitment Platform
```

---

## Sprint 33 — Integration Reliability

### Objective

Make the integration reliable.

### Tasks

* Add Integration Status
* Add Integration Error
* Add External Candidate Id
* Add Integration Attempts
* Handle failures
* Design retry strategy
* Implement duplicate prevention
* Implement idempotency
* Improve administrator visibility
* Add test coverage

### Expected Result

The integration should not simply work in the happy path; it should also behave predictably when external systems fail.

---

## Sprint 34 — Integration Architecture

### Integration A — Immediate Verification

Use synchronous processing when the user needs an immediate external response.

```text
LWC
 ↓
Apex
 ↓
External API
 ↓
Response
 ↓
LWC
```

### Integration B — Candidate Synchronization

Use asynchronous processing.

```text
Trigger
 ↓
Service
 ↓
Queueable
 ↓
Callout
 ↓
External Recruitment System
```

### Integration C — Large Data Synchronization

For a large nightly synchronization:

```text
Scheduled Apex
      ↓
Batch Apex
      ↓
External Integration
      ↓
Error Handling
      ↓
Retry
```

---

# 20. Key Concepts Learned

This project demonstrates understanding of:

* API
* REST API
* HTTP
* GET
* POST
* PUT
* PATCH
* DELETE
* HTTP Request
* HTTP Response
* HTTP Status Codes
* JSON
* Apex Callouts
* HttpRequest
* Http
* HttpResponse
* Queueable Apex
* Named Credentials
* Authentication
* Authorization
* Auth Providers
* Error Handling
* Retry
* Idempotency
* Duplicate Prevention
* Salesforce Connect
* External Objects
* Point-to-Point Integration
* Middleware
* Synchronous Integration
* Asynchronous Integration
* Scheduled Apex
* Batch Apex

---

# 21. Interview Questions

### What is an API?

An API is a contract that allows different software systems to communicate.

### What is a REST API?

A REST API is an API style that commonly uses HTTP methods and structured representations such as JSON.

### What is an Apex callout?

An Apex callout is a request made from Salesforce to an external system.

### Why use Queueable Apex?

Queueable Apex allows external integration work to be performed asynchronously.

### Why use Named Credentials?

Named Credentials provide a secure and maintainable way to manage external endpoint and authentication configuration.

### Authentication vs Authorization?

Authentication answers:

```text
Who are you?
```

Authorization answers:

```text
What are you allowed to do?
```

### What is idempotency?

Idempotency ensures that repeated processing of the same business operation does not incorrectly create duplicate effects.

### Why track integration status?

To provide visibility into whether communication with the external system succeeded, failed, or requires retry.

### When should an integration be synchronous?

When the user needs the external response immediately.

### When should an integration be asynchronous?

When the external work can happen in the background and the user does not need to wait.

### What is middleware?

Middleware is an integration layer that can provide routing, transformation, orchestration, monitoring, and retry capabilities between systems.

---

# 22. Final Outcome

The completed External Recruitment Gateway provides a reliable connection between the Salesforce Placement Management System and an external recruitment platform.

The final architecture is:

```text
                 SALESFORCE
                     |
                     v
              Placement System
                     |
                     v
               Application
                     |
              Status = Selected
                     |
                     v
                  Trigger
                     |
                     v
                  Service
                     |
                     v
             Queueable Apex
                     |
                     v
             Named Credential
                     |
                     v
                REST API
                     |
                     v
        External Recruitment System
                     |
                     v
                HTTP Response
                 /          \
                /            \
           Success          Failure
              |                |
              v                v
           Success           Failed
              |                |
              |              Retry
              |                |
              +-------<--------+
```

This project demonstrates how Salesforce can safely and reliably communicate with external systems while separating business logic, asynchronous processing, authentication, failure handling, retry, and duplicate prevention.
