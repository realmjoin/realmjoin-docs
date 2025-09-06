# Export Enterprise App Users

Export a CSV of all (entprise) app owners and users

## Description

Export a CSV of all (entprise) app owners and users.

## Location

Org &rarr; Security &rarr; Export Enterprise App Users

## Notes

Permissions:
MS Graph (API)
- Directory.Read.All
- Application.Read.All
Azure IaaS: "Contributor" access on subscription or resource group used for the export

## Permissions

### API Permissions

**Microsoft Graph**
- Directory.Read.All
- Application.Read.All

### Manual Permissions

- Azure IaaS: - Contributor - access on subscription or resource group used for the export

## Parameters

### -entAppsOnly

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _True_ |
| Required | _false_ |
| Position | _1_ |

### -ContainerName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |

### -ResourceGroupName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _3_ |

### -StorageAccountName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _4_ |

### -StorageAccountLocation

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _5_ |

### -StorageAccountSku

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _6_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _7_ |


