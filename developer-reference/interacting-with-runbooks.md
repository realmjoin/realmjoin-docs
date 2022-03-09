---
description: Run runbooks and query their status using RealmJoins API
---

# Interacting with Runbooks

## Overview

RealmJoin allows you to use Azure Automation Runbooks to automate day to day operations in your environment. See [Runbooks](../runbooks/README.md) for more information.

RealmJoin's API allows you to start runbooks from your application, to query the successful execution of previously triggered runs. See [RealmJoin's Swagger description](https://realmjoin-backend.azurewebsites.net/swagger/index.html#/Runbook) to see, which operations are currently supported.

The following sections lay out how to use RealmJoin's API to start and track runbook jobs. It is assumed that you already have [connected an Azure Automation account](../onboarding/connecting-azure-automation.md) to RealmJoin Portal. Also, make sure to [authenticate ](realmjoin-api/authentication.md)every request against RealmJoin's API using an appropriate http Authorization header.

## How does Azure Automation handle runbooks?

Azure Automation has a batch processing approach regarding runbooks. When you trigger the execution of a runbook, a job is created for this runbook and queued for execution.

So in general, a runbook will not start immediately. Also multiple job's for the same runbook can exist at the same time in different states of execution.

Every job has a set of parameters (inputs) that are passed on to the runbook script. This can e.g. be two variables like `$username` and `$newEmailAddress` if the runbook is supposed to add an eMail-Alias to a user's mailbox.

Every job has a status that represents its current state of execution, see [Microsoft Docs](https://docs.microsoft.com/en-us/azure/automation/automation-runbook-execution#job-statuses). We will focus on `Queued`, `Running`, `Completed` and `Failed` in this document. Be aware this is a simplification for the purpose of easier understanding.

## Starting a Runbook Job

RealmJoin API offers two endpoints to trigger runbooks.&#x20;

`run` will execute a runbook in a synchronous fashion and only return/finish when the runbook is actually completed or failed. This endpoint directly returns the success state and output of the associated runbook job.&#x20;

`start` will take the same parameters as `run` but works in a an asynchronous fashion. It will return as soon as a runbook job is queued. It will return the `jobID` to enable easy tracking of the new job.

### Example

Let us assume the following situation:

* You have your RealmJoin API credentials and encoded them to `dC0xMjM0MTIzNDpteVMzY3JldCE=` (Base64)
* You want to start the runbook `rjgit-user_security_revoke-or-restore-access` to block sign in for a specific user
* The parameters for the runbook (PowerShell) are:&#x20;
  * `$UserName = "someone@contoso.com"`&#x20;
  * `$Revoke = $true`

We will use the `run` endpoint to immediately know if the job was successful.&#x20;

Let us build the **request**:

Headers:

```http
Authorization: Basic dC0xMjM0MTIzNDpteVMzY3JldCE=
Content-Type: application/json
```

Request / URI:

```http
GET https://realmjoin-backend.azurewebsites.net/api/external/runbook/rjgit-user_security_revoke-or-restore-access/run
```

Body (in JSON-Notation):

```json
{ 
   "UserName": "someone@contoso.com", 
   "Revoke": true 
}
```

The request will take a while, as it waits for the job to execute. Please make sure you adapt your http clients timeout accordingly. Otherwise try using the `start` endpoint, which will immediately return.

The response will contain the `jobID`, the `status` (`Failed` or `Completed`) and all output streams of the runbook.

**Response**:

Http Status: `200` (OK)

Body (in JSON-Notation):

```json
{
    "jobID": "1234545e-7a24-436a-90c9-6056b512345",
    "status": "Completed",
    "streams": [
        {
            "time": "2021-12-15T14:47:27.7756185+00:00",
            "summary": "RealmJoin.RunbookHelper: Running in Azure Automation account",
            "streamType": "Verbose",
            "streamText": null,
            "value": null
        },
        {
            "time": "2021-12-15T14:47:27.96063+00:00",
            "summary": "getAutomationConnectionOrFromLocalCertificate: Getting automation connection 'AzureRunAsConnection'",
            "streamType": "Verbose",
            "streamText": null,
            "value": null
        },
        {
            "time": "2021-12-15T14:47:31.560861+00:00",
            "summary": "Connect-RjRbAzureAD: Connecting with AzureAD module: ...",
            "streamType": "Verbose",
            "streamText": null,
            "value": null
        },
        {
            "time": "2021-12-15T14:47:33.8860333+00:00",
            "summary": "## User access for someone@contoso.com has been revoked.",
            "streamType": "Output",
            "streamText": null,
            "value": null
        }
    ]
}
```

The output streams are separated into different channels (`streamTypes`): `Output`, `Verbose`, `Error`. This allows to filter for errors or reduce output only to relevant information by only showing `Output`.&#x20;

You can get these streams after a runbook is finished using the `/api/external/runbook/jobs/{jobID}/output/streams` endpoint. (see below)

## Querying a Job's status and output

If a job has already beed created, you can use RealmJoin API to query its state and output.

### Querying Job Status

Use `/api/external/runbook/jobs/{jobID}/status` to query for the current status.

See [Authentication ](realmjoin-api/authentication.md)on how to create an Authorization header, the following is only an example.

Assume the `jobID` to be `1234545e-7a24-436a-90c9-6056b512345`

**`Request`**

Headers:

```http
Authorization: Basic dC0xMjM0MTIzNDpteVMzY3JldCE=
Content-Type: application/json
```

Request / URI:

```html
GET https://realmjoin-backend.azurewebsites.net/api/external/runbook/jobs/1234545e-7a24-436a-90c9-6056b512345/status
```

This request has no body.

**Response**

Http Status 200 (OK)

Body (Plaintext)

```
Completed
```

Other possible states include `New`, `Failed`, `Running`. See [possible Runbook states](https://docs.microsoft.com/en-us/azure/automation/automation-runbook-execution#job-statuses).&#x20;

### Reading Job Output

Use `/api/external/runbook/jobs/{jobID}/output/text` to get a simple plaintext representation of the output of a runbook. This will not include the `Verbose` and `Error` stream. See [reading streams](interacting-with-runbooks.md#reading-specific-streams) to read other streams. [Exceptions](interacting-with-runbooks.md#reading-exceptions) are handled separately.

See [Authentication ](realmjoin-api/authentication.md)on how to create an Authorization header, the following is only an example.

Assume the `jobID` to be `1234545e-7a24-436a-90c9-6056b512345`

**Request**

Headers:

```http
Authorization: Basic dC0xMjM0MTIzNDpteVMzY3JldCE=
Content-Type: application/json
```

Request / URI:

```html
GET https://realmjoin-backend.azurewebsites.net/api/external/runbook/jobs/1234545e-7a24-436a-90c9-6056b512345/output/text
```

This request has no body.

**Response**

Http Status 200 (OK)

Body (Plaintext)

```
## Distribution Group 'Sales Team' has been created.
```

### Reading specific Streams

Use `/api/external/runbook/jobs/{jobID}/output/streams` to get a comprehensive json representation of the output of a runbook. This way you can access the `Output`, `Verbose` and `Error` stream. [Exceptions](interacting-with-runbooks.md#reading-exceptions) are handled separately.

See [Authentication ](realmjoin-api/authentication.md)on how to create an Authorization header, the following is only an example.

Assume the `jobID` to be `1234545e-7a24-436a-90c9-6056b512345`

**Request (all streams)**

Headers:

```http
Authorization: Basic dC0xMjM0MTIzNDpteVMzY3JldCE=
Content-Type: application/json
```

Request / URI:

```html
GET https://realmjoin-backend.azurewebsites.net/api/external/runbook/jobs/1234545e-7a24-436a-90c9-6056b512345/output/streams
```

This request has no body.

**Response**

Http Status 200 (OK)

Body (JSON, array of messages)

```json
[
    {
        "time": "2021-12-20T08:37:46.8572747+00:00",
        "summary": "Loading module from path 'C:\\Modules\\User\\RealmJoin.RunbookHelper\\RealmJoin.RunbookHelper.psd1'.",
        "streamType": "Verbose",
        "streamText": null,
        "value": null
    },
    {
        "time": "2021-12-20T08:37:46.9272241+00:00",
        "summary": "Loading module from path 'C:\\Modules\\User\\RealmJoin.RunbookHelper\\RealmJoin.RunbookHelper.psm1'.",
        "streamType": "Verbose",
        "streamText": null,
        "value": null
    },
    {
        "time": "2021-12-20T08:37:47.1522235+00:00",
        "summary": "RealmJoin.RunbookHelper: Running in Azure Automation account",
        "streamType": "Verbose",
        "streamText": null,
        "value": null
    },
    {
        "time": "2021-12-20T08:37:47.3122219+00:00",
        "summary": "Regular Output",
        "streamType": "Output",
        "streamText": null,
        "value": null
    },
    {
        "time": "2021-12-20T08:37:47.8422225+00:00",
        "summary": "Verbose or Debug Message",
        "streamType": "Verbose",
        "streamText": null,
        "value": null
    },
    {
        "time": "2021-12-20T08:37:47.7672223+00:00",
        "summary": "Non-interrupting Error Message",
        "streamType": "Error",
        "streamText": null,
        "value": null
    }
]
```

See below to read interrupting error messages and [exceptions](interacting-with-runbooks.md#reading-exceptions)

To just receive a single stream, for example Verbose, you can add a filter to the request by adding `?streamTypes=Verbose`. You can also filter for `Output` and `Error`.

**Request (filter for a single stream)**

Headers:

```http
Authorization: Basic dC0xMjM0MTIzNDpteVMzY3JldCE=
Content-Type: application/json
```

Request / URI:

```html
GET https://realmjoin-backend.azurewebsites.net/api/external/runbook/jobs/1234545e-7a24-436a-90c9-6056b512345/output/streams?streamTypes=Verbose
```

This request has no body.

**Response**

Http Status 200 (OK)

Body (JSON, array of messages)

```json
[
    {
        "time": "2021-12-20T08:37:46.8572747+00:00",
        "summary": "Loading module from path 'C:\\Modules\\User\\RealmJoin.RunbookHelper\\RealmJoin.RunbookHelper.psd1'.",
        "streamType": "Verbose",
        "streamText": null,
        "value": null
    },
    {
        "time": "2021-12-20T08:37:46.9272241+00:00",
        "summary": "Loading module from path 'C:\\Modules\\User\\RealmJoin.RunbookHelper\\RealmJoin.RunbookHelper.psm1'.",
        "streamType": "Verbose",
        "streamText": null,
        "value": null
    },
    {
        "time": "2021-12-20T08:37:47.1522235+00:00",
        "summary": "RealmJoin.RunbookHelper: Running in Azure Automation account",
        "streamType": "Verbose",
        "streamText": null,
        "value": null
    },
    {
        "time": "2021-12-20T08:37:47.8422225+00:00",
        "summary": "Verbose or Debug Message",
        "streamType": "Verbose",
        "streamText": null,
        "value": null
    }
]
```

### Reading Exceptions

Use `/api/external/runbook/jobs/{jobID}/exception/text` to get a simple plaintext representation of a runbook's exception message (if present). This will not include the `Output`, `Verbose` and `Error` streams. See [reading streams](interacting-with-runbooks.md#reading-specific-streams) to read other streams.&#x20;

Exceptions are written, when interrupting errors happen in the execution of the PowerShell script associated with the runbook. This endpoint will only read the plaintext message and does not include technical details, like at which line of code the script stopped.&#x20;

In out example, an interrupting error was caused by `throw "Exception"`.

See [Authentication ](realmjoin-api/authentication.md)on how to create an Authorization header, the following is only an example.

Assume the `jobID` to be `1234545e-7a24-436a-90c9-6056b512345`

**Request**

Headers:

```http
Authorization: Basic dC0xMjM0MTIzNDpteVMzY3JldCE=
Content-Type: application/json
```

Request / URI:

```html
GET https://realmjoin-backend.azurewebsites.net/api/external/runbook/jobs/1234545e-7a24-436a-90c9-6056b512345/exception/text
```

This request has no body.

**Response**

Http Status 200 (OK)

Body (Plaintext)

```
Exception (Exception)
```
