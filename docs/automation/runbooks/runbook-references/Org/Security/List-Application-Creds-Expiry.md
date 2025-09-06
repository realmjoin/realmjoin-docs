# List Application Creds Expiry

List expiry date of all AppRegistration credentials

## Description

List the expiry date of all AppRegistration credentials, including Client Secrets and Certificates.
Optionally, filter by Application IDs and list only those credentials that are about to expire.

## Location

Org &rarr; Security &rarr; List Application Creds Expiry

## Permissions

### API Permissions

**Microsoft Graph**
- Application.Read.All

## Parameters

### -listOnlyExpiring

**Description:** If set to true, only credentials that are about to expire within the specified number of days will be listed.
If set to false, all credentials will be listed regardless of their expiry date. 

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _1_ |

### -Days

**Description:** The number of days before a credential expires to consider it "about to expire". 

| Name | Value |
|---|---|
| Type | _Int32_ |
| Default Value | _30_ |
| Required | _false_ |
| Position | _2_ |

### -ApplicationIds

**Description:** A comma-separated list of Application IDs to filter the credentials. 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _4_ |


