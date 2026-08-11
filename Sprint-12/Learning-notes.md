# Sprint 11 – Learning Notes

## 1. API

An API is a structured contract that allows two software systems to communicate.

The systems do not need to know each other's internal implementation. They only need to follow the agreed contract.

```text
Salesforce → Request → External API
Salesforce ← Response ← External API
```

## 2. REST API

REST is a common style of web API communication using HTTP.

Common methods:

| Method | Typical Meaning |
|---|---|
| GET | Retrieve data |
| POST | Create/process something |
| PUT | Replace/update a resource |
| PATCH | Partially update a resource |
| DELETE | Remove a resource |

The HTTP method communicates the intended operation.

## 3. Request and Response

A request can contain:

- URL
- HTTP method
- Headers
- Authentication information
- Optional body

A response can contain:

- Status code
- Headers
- Optional body

## 4. HTTP Status Codes

Important codes:

- `200` – Success
- `201` – Resource created
- `204` – Success with no response body
- `400` – Bad request
- `401` – Authentication required/failed
- `403` – Forbidden
- `404` – Resource not found
- `500` – Server-side error

The integration must interpret these responses instead of assuming every request succeeds.

## 5. JSON

JSON is commonly used to exchange API data.

Example:

```json
{
  "jobId": "JOB1007",
  "company": "KSquare",
  "role": "Salesforce Developer",
  "eligibleBranches": ["CSE", "IT", "AIML"],
  "minimumCgpa": 7.0
}
```

JSON contains objects, keys, values and arrays.

In Apex, JSON can be converted into Apex objects or maps, and Apex objects can be serialized using `JSON.serialize()`.

## 6. Salesforce HTTP Callout

Apex can communicate with external APIs using:

```text
HttpRequest
    ↓
Configure request
    ↓
Http
    ↓
send()
    ↓
HttpResponse
```

Important classes:

- `HttpRequest` – represents the outgoing request.
- `Http` – sends the request.
- `HttpResponse` – contains the external response.

Typical request configuration includes endpoint, method, headers and body.

## 7. Queueable Apex and Callouts

For candidate synchronisation, the architecture is:

```text
Application Selected
        ↓
Trigger
        ↓
Service
        ↓
Queueable
        ↓
HTTP Callout
        ↓
External API
```

Queueable Apex is useful when external communication is secondary to the main Salesforce transaction.

It also avoids making the user wait for the external system.

## 8. Named Credentials

A Named Credential provides managed configuration for an external endpoint and its authentication.

Instead of putting credentials in Apex, code refers to the configured Named Credential.

```text
Apex
 ↓
Named Credential
 ↓
Authentication
 ↓
External API
```

Benefits:

- Better security
- Easier credential rotation
- Environment-specific configuration
- Less sensitive information in source code

## 9. Authentication vs Authorisation

**Authentication:** Who are you?

**Authorisation:** What are you allowed to do?

A useful mental model:

```text
401 → Investigate authentication
403 → Investigate permissions/authorisation
```

The exact behaviour depends on the external API.

## 10. Auth Providers

An Auth Provider can help Salesforce handle authentication with supported external identity providers.

At a conceptual level:

```text
External Identity Provider
        ↓
Auth Provider
        ↓
Salesforce Authentication Configuration
        ↓
Named Credential
        ↓
Apex Callout
```

The exact configuration depends on the authentication protocol and provider.

## 11. Callouts and Transactions

Salesforce has restrictions around callouts and uncommitted work.

A cleaner architecture is often:

```text
Immediate Salesforce Transaction
        ↓
Commit Essential Work
        ↓
Queueable
        ↓
Callout
```

This separates the Salesforce business transaction from external communication.

## 12. Failure Handling

Salesforce success does not automatically mean external-system success.

Example:

```text
Salesforce Selection = Successful
External Synchronisation = Failed
```

These are separate states.

Useful fields include:

- Integration Status
- External Reference
- Last Attempt
- Error Message

## 13. Retry

A temporary HTTP 500 may be retryable.

Possible flow:

```text
Pending
  ↓
Queueable
  ↓
Success → Sent

Failure
  ↓
Retry Required
```

Retry logic must avoid creating duplicates.

## 14. Idempotency

Idempotency means that processing the same business request multiple times should not incorrectly create multiple outcomes.

For candidate synchronisation, possible identifiers are:

- Salesforce Application Id
- External Reference Id
- Idempotency Key

Example problem:

```text
Retry 1 → Candidate created
Retry 2 → Candidate created again
```

The integration should prevent this.

## 15. Salesforce Connect and External Objects

External Objects allow Salesforce to access data that remains primarily in an external system.

Use them when:

- The data is large.
- Salesforce mainly needs access rather than ownership.
- Copying the complete dataset would be unnecessary.

Consider Salesforce-native storage when the data is central to Salesforce business processes, automation and reporting.

## 16. Copy Data vs Access Data

### Copy Data

```text
External System
      ↓
Integration
      ↓
Salesforce Records
```

Advantages:

- Salesforce-native reporting
- Local access
- Salesforce automation

Challenges:

- Duplicate data
- Synchronisation complexity
- Storage
- Stale data risk

### Access External Data

```text
External System
      ↑
External Object
      ↑
Salesforce
```

Advantages:

- Less duplication
- Access without copying everything

Challenges:

- Latency
- Query limitations
- External-system dependency
- Different reporting and automation capabilities

## 17. Point-to-Point Integration

```text
Salesforce ↔ External System
```

Simple and suitable for a small integration landscape.

With many systems, direct integrations can become difficult to maintain.

## 18. Middleware

```text
Salesforce
     ↕
Middleware
     ↕
External Systems
```

Middleware can provide:

- Transformation
- Routing
- Orchestration
- Monitoring
- Retries
- Protocol conversion

The source mentions MuleSoft as an example of middleware knowledge relevant to Salesforce roles.

## 19. Synchronous Integration

```text
Salesforce
    ↓
External API
    ↓
Response
    ↓
Salesforce
```

Use when the user needs an immediate answer.

Example: verifying an external certification number.

## 20. Asynchronous Integration

```text
Salesforce
    ↓
Queueable
    ↓
External API
```

Use when the external operation can happen later.

Example: sending selected candidate information.

## 21. Large Historical Synchronisation

For a large nightly integration such as 200,000 records, a user-triggered synchronous request is inappropriate.

A possible architecture is:

```text
Scheduled Apex
      ↓
Batch Apex
      ↓
Integration
      ↓
Error Handling / Retry
```

## 22. Integration Architecture

For the Placement Management System:

```text
LWC
 ↓
Apex Trigger / Service
 ↓
Queueable Apex
 ↓
Named Credential
 ↓
REST API
 ↓
External Recruitment Platform
```

The design keeps responsibilities separated.


## Interview Summary

A strong integration answer should cover more than the API call.

```text
Business Event
 ↓
Trigger / Service
 ↓
Queueable
 ↓
Named Credential
 ↓
REST Callout
 ↓
Response
 ↓
Status / Error Handling
 ↓
Retry + Idempotency
```

The key lesson is to design for the real world: external systems can be slow, unavailable, incorrectly configured or return unexpected responses.
