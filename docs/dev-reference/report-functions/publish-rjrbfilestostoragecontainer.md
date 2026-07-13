---
type: Developer Reference
description: Upload local files to an Azure Storage container from Azure Automation runbooks and return time-limited SAS download links.
---

# Publish-RjRbFilesToStorageContainer

## Overview

`Publish-RjRbFilesToStorageContainer` is the standard helper for delivering report files (CSV, XLSX, ZIP, …) from RealmJoin reporting runbooks via Azure Blob Storage. It uploads one or more local files to a target container and returns a time-limited SAS download link for each blob, suitable for inclusion in report emails, Teams messages, or runbook outputs.

Key characteristics:

- **No `Az.Storage` dependency** — blob operations are performed directly against the Azure Storage REST API (container creation, upload, SAS token generation). This eliminates the well-known assembly conflict between `Az.Storage` and `ExchangeOnlineManagement` that surfaces in mixed reporting runbooks.
- **Self-connecting** — if no `Az` context is active the function transparently calls `Connect-RjRbAzAccount`. An optional `-SubscriptionId` switches context before any storage operation.
- **Container auto-created** — if the target container does not exist yet it is created on the fly; an existing container (HTTP 409) is treated as success.
- **HttpClient-based uploads** — uses `System.Net.Http.HttpClient` directly because Azure Automation's `Invoke-RestMethod` interceptor strips required custom headers (`x-ms-blob-type`) with binary bodies.
- **Read-only SAS links** — each returned URL is signed with the storage account key, scoped to a single blob, HTTPS-only, and valid for `LinkExpiryDays` days (default 6).

The central storage settings (resource group, account name, expiry days, blob-name prefix) consumed by a typical runbook live in the RealmJoin customization JSON and are documented in [Runbook Report Settings — Storage Account Delivery](../../automation/runbooks/runbook-report-settings.md#storage-account-delivery). This document focuses on calling the function from a runbook.

## Prerequisites

### Azure Storage Account

An existing Azure Storage Account (general-purpose v2 recommended) is required. The target container does not need to exist beforehand — it is created automatically on first use.

### Azure RBAC on the storage account

The Automation Account's managed identity (or the service principal used by the runbook) needs the following permissions on the storage account or its resource group:

| Action | Required for |
| --- | --- |
| `Microsoft.Storage/storageAccounts/read` | Reading the storage account |
| `Microsoft.Storage/storageAccounts/listKeys/action` | Retrieving the account key used for SharedKey signing and SAS generation |

The built-in role **Storage Account Contributor** covers both. **Storage Blob Data Contributor** alone is *not* sufficient because the function signs requests with the account key rather than using AAD-backed blob operations.

### Module connectivity

The function requires the `Az.Accounts` module in the runbook environment (`Get-AzContext`, `Set-AzContext`, `Connect-AzAccount`, `Invoke-AzRestMethod`). Declare it explicitly in the consuming runbook:

```powershell
#Requires -Modules @{ModuleName = "RealmJoin.RunbookHelper"; ModuleVersion = "0.8.6" }
#Requires -Modules @{ModuleName = "Az.Accounts"; ModuleVersion = "5.3.4" }
```

If `Az.Accounts` is not available at runtime the function fails fast with a clear error message — it checks for `Get-AzContext` up-front and throws *"Publish-RjRbFilesToStorageContainer requires the 'Az.Accounts' module. Add #Requires -Modules @{ModuleName = 'Az.Accounts'; ModuleVersion = '5.3.4'} to the calling runbook."* before any Azure call is made.

> **Why isn't `Az.Accounts` declared as a `RequiredModules` entry in `RealmJoin.RunbookHelper.psd1`?**
>
> `Az.Accounts` is intentionally listed only under `ExternalModuleDependencies` (informational) and *not* under `RequiredModules` (enforced at `Import-Module` time):
>
> - **Pay-only-for-what-you-use.** Many runbooks consume only Graph-based helpers (e.g. `Send-RjRbReportEmail` without `-UseNativeGraphRequest`, or `Invoke-RjRbRestMethodGraph`) and never touch any Az.* cmdlet. Promoting `Az.Accounts` to `RequiredModules` would force every consuming runbook to ship the module even when nothing in its code path needs it — measurably increasing cold-start time in Azure Automation.
> - **Avoid version skirmishes.** A hard `RequiredModules` constraint triggers auto-resolution at import time and can drag in a specific `Az.Accounts` version that conflicts with what the runbook itself pins (Az.* sub-modules are notoriously version-sensitive). Letting the runbook declare its own `#Requires -Modules` keeps the version choice with the caller.
> - **Per-runbook authority.** In Azure Automation the canonical place to declare module requirements is at the runbook level via `#Requires`, not at the helper-module level. The helper module surfaces the dependency informationally (via `ExternalModuleDependencies` in the manifest) and via the runtime check above, so misconfiguration fails loudly with an actionable message rather than silently masking a version conflict.

`Az.Storage` is **not** required and should not be imported in the same runbook to avoid the assembly conflict mentioned above.

## Quick Start

The minimum viable call requires the local file path(s), the container name, the resource group and the storage account name:

```powershell
$csvPath = Join-Path $env:TEMP 'devices.csv'
$exportData | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

$results = Publish-RjRbFilesToStorageContainer `
    -FilePaths          $csvPath `
    -ContainerName      'reports' `
    -ResourceGroupName  'rg-reports' `
    -StorageAccountName 'stcontosoreports'

$results | Format-Table BlobName, EndTime, SASLink
```

This uploads `devices.csv` to the `reports` container in `stcontosoreports` and returns one object with the blob name, the SAS expiry timestamp, and a ready-to-share download URL valid for the default 6 days.

## Parameters

### Required

| Parameter | Type | Description |
| --- | --- | --- |
| `FilePaths` | `string[]` | One or more local file paths to upload. Each path must point to an existing file (`Test-Path -PathType Leaf`); the function throws upfront if any entry is missing. |
| `ContainerName` | `string` | Target blob container. Created automatically if it does not exist. Must comply with Azure container naming rules (lowercase, 3–63 chars, alphanumeric + hyphen). Container name is a *per-runbook* decision and is set in the runbook, not in central settings. |
| `ResourceGroupName` | `string` | Resource group that contains the storage account. Usually wired to the central setting `RJReport.AzureStorage.ResourceGroup`. |
| `StorageAccountName` | `string` | Name of the Azure Storage Account. Usually wired to the central setting `RJReport.AzureStorage.StorageAccountName`. |

### Optional

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `SubscriptionId` | `string` | current context | Azure subscription that hosts the storage account. If supplied, `Set-AzContext -Subscription` is called before any storage operation. Omit to use the current `Az` context. |
| `LinkExpiryDays` | `int` | `6` | SAS link validity in days. Validated to `[1, 3650]`. The same expiry timestamp is applied to all blobs in a single call. Usually wired to the central setting `RJReport.AzureStorage.LinkExpiryDays`. |
| `AddBlobNamePrefix` | `bool` | `$false` | When `$true`, blob names are prefixed with `yyyyMMdd-HHmmss-` (timestamp from `Get-Date` at upload time) to prevent overwrites in repeated runs. The original file name is kept as the suffix. |

> **Note:** The mapping between these parameters and the central RealmJoin customization JSON (including the recommended defaults) is documented in [Runbook Report Settings — Storage Account Delivery](../../automation/runbooks/runbook-report-settings.md#storage-account-delivery).

## Usage Examples

### Recommended runbook pattern

This is the canonical pattern used by reporting runbooks. Storage configuration is pulled from the central RealmJoin customization via `Use-RJInterface -Type Setting`, the container is hard-coded per runbook, and a missing configuration causes the runbook to abort with an actionable message:

```powershell
#Requires -Modules @{ModuleName = "RealmJoin.RunbookHelper"; ModuleVersion = "0.8.6" }
#Requires -Modules @{ModuleName = "Az.Accounts"; ModuleVersion = "5.3.4" }

param(
    [string] $ContainerName = "my-runbook-output",

    [ValidateScript( { Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process; Use-RJInterface -Type Setting -Attribute "RJReport.AzureStorage.ResourceGroup" } )]
    [string] $ResourceGroupName,

    [ValidateScript( { Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process; Use-RJInterface -Type Setting -Attribute "RJReport.AzureStorage.StorageAccountName" } )]
    [string] $StorageAccountName,

    [ValidateScript( { Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process; Use-RJInterface -Type Setting -Attribute "RJReport.AzureStorage.LinkExpiryDays" } )]
    [ValidateRange(1, 3650)]
    [int] $LinkExpiryDays = 6
)

Connect-RjRbAzAccount

if ((-not $ResourceGroupName) -or (-not $StorageAccountName)) {
    "## To export to a storage account, please use RJ Runbooks Customization"
    "## ( https://portal.realmjoin.com/settings/runbooks-customizations ) to configure:"
    "##   - RJReport.AzureStorage.ResourceGroup"
    "##   - RJReport.AzureStorage.StorageAccountName"
    throw "Missing Storage Account Configuration."
}

# … produce the export file …
$exportPath = "myReport.csv"

$uploadResults = Publish-RjRbFilesToStorageContainer `
    -FilePaths          @($exportPath) `
    -ContainerName      $ContainerName `
    -ResourceGroupName  $ResourceGroupName `
    -StorageAccountName $StorageAccountName `
    -LinkExpiryDays     $LinkExpiryDays `
    -AddBlobNamePrefix  $true

$uploadResult = $uploadResults[0]
"## Export created."
"## Expiry of Link: $($uploadResult.EndTime)"
$uploadResult.SASLink | Out-String
```

A few conventions worth keeping when adopting this pattern:

- The three central settings (`ResourceGroup`, `StorageAccountName`, `LinkExpiryDays`) are exposed as runbook parameters wired via `Use-RJInterface -Type Setting`, but typically *hidden* in the runbook customization (`"Hide": true`) so end users never see them.
- The container name is hard-coded per runbook (often via a `param` default) so that lifecycle policies and access controls can be tuned per export type — it is intentionally *not* a central setting.
- `AddBlobNamePrefix $true` is the safe default for periodic exports that produce a fixed file name on every run.
- The function is called inside the runbook's main `try { … } catch { throw $_ } finally { Disconnect-AzAccount … }` block so partial failures bubble up to the Automation job and the Az context is released even on success.

### Multiple files in one call

`FilePaths` accepts an array; each file is uploaded sequentially and a result object is returned for every uploaded blob.

```powershell
$results = Publish-RjRbFilesToStorageContainer `
    -FilePaths          @($csvPath, $xlsxPath) `
    -ContainerName      'reports' `
    -ResourceGroupName  $ResourceGroupName `
    -StorageAccountName $StorageAccountName

foreach ($r in $results) {
    "Uploaded $($r.BlobName) — download until $($r.EndTime): $($r.SASLink)"
}
```

### Custom link lifetime and explicit subscription

```powershell
Publish-RjRbFilesToStorageContainer `
    -FilePaths          $exportPaths `
    -ContainerName      'quarterly-reports' `
    -ResourceGroupName  $ResourceGroupName `
    -StorageAccountName $StorageAccountName `
    -SubscriptionId     '00000000-0000-0000-0000-000000000000' `
    -LinkExpiryDays     30
```

Useful when the runbook spans multiple subscriptions, or when downstream recipients need a longer window than the 6-day default.

### Combining with `Send-RjRbReportEmail`

A common pattern is to upload bulky data to blob storage and embed the SAS link in a report email, keeping the email well below the 4 MB Graph `sendMail` limit:

```powershell
$uploaded = Publish-RjRbFilesToStorageContainer `
    -FilePaths          $csvPath `
    -ContainerName      'reports' `
    -ResourceGroupName  $ResourceGroupName `
    -StorageAccountName $StorageAccountName `
    -AddBlobNamePrefix  $true

$linkLine = "[Download {0}]({1}) (valid until {2:yyyy-MM-dd HH:mm} UTC)" -f `
    $uploaded[0].BlobName, $uploaded[0].SASLink, $uploaded[0].EndTime.ToUniversalTime()

$reportMd = @"
# Device Inventory

The full device list is available as a download:

$linkLine
"@

Send-RjRbReportEmail `
    -EmailFrom       $emailFrom `
    -EmailTo         'it-reports@contoso.com' `
    -Subject         "Device Inventory — $(Get-Date -Format 'yyyy-MM-dd')" `
    -MarkdownContent $reportMd
```

See [Send-RjRbReportEmail](send-rjrbreportemail.md) for the email side of this pattern.

## Behavior & Error Handling

### Up-front file validation

Before any Azure call is made, the function iterates over `FilePaths` and throws `File '<path>' was not found.` for the first missing entry. This prevents partial uploads when the caller passes a typo.

### Azure context resolution

`Get-AzContext` is checked first. If there is no context or the context has no `Account` (e.g. a fresh runbook execution), the function calls `Connect-RjRbAzAccount` to authenticate the managed identity. If `-SubscriptionId` is supplied, `Set-AzContext -Subscription` is invoked next.

### Container creation

The container is created with a `PUT …?restype=container` request:

- **HTTP 201** — container created.
- **HTTP 409** — container already exists; treated as success.
- **Any other status** — the function throws `Container creation failed (<status>): <body>`.

### Upload failures

Each file is uploaded via `HttpClient.SendAsync`. A non-success status terminates the call with `Blob upload failed (<status>): <body>`, including the raw error returned by Azure Storage. Earlier files that were already uploaded in the same call remain on the storage account — the caller may want to wrap the call in a try/catch and run cleanup if partial uploads are unacceptable.

### Key retrieval failures

`Invoke-AzRestMethod` is used to call the ARM `listKeys` endpoint. If the response status is anything other than 200, the function throws `Failed to retrieve storage account keys for '<account>' in resource group '<rg>'. Status: <status>`. The most common causes are:

- Missing `Microsoft.Storage/storageAccounts/listKeys/action` on the managed identity.
- Wrong subscription context (combine with `-SubscriptionId`).
- Typo in `StorageAccountName` or `ResourceGroupName`.
- The central settings `RJReport.AzureStorage.ResourceGroup` / `RJReport.AzureStorage.StorageAccountName` not configured — see [Runbook Report Settings](../../automation/runbooks/runbook-report-settings.md#storage-account-delivery).

### SAS token characteristics

The generated tokens use:

- `sv=2023-11-03` (signed version)
- `sr=b` (blob-scoped)
- `sp=r` (read-only)
- `spr=https` (HTTPS-only)
- `st` set to 5 minutes in the past (clock skew tolerance) and `se` to `LinkExpiryDays` from the time of the call.

Tokens are signed with the storage account key. **Anyone with the link can download the blob until expiry** — treat the returned SAS URL as a secret.

## Outputs

Each successful upload produces a `PSCustomObject` with these properties:

| Property | Type | Description |
| --- | --- | --- |
| `BlobName` | `string` | The final blob name in the container, including the timestamp prefix if `AddBlobNamePrefix` is `$true`. |
| `EndTime` | `datetime` | Local-time SAS expiry (also encoded in the URL as UTC). |
| `SASLink` | `string` | Fully-qualified HTTPS download URL with embedded SAS token. |

Results are returned in the same order as `FilePaths`. Even when uploading a single file the return value is an array — index it (`$results[0]`) or iterate with `foreach` rather than treating it as a scalar.

## See Also

- [Runbook Report Settings — Storage Account Delivery](../../automation/runbooks/runbook-report-settings.md#storage-account-delivery) — central configuration of the storage account, link expiry and blob-name prefix used by reporting runbooks.
- [Send-RjRbReportEmail](send-rjrbreportemail.md) — companion helper for delivering reports via email; commonly combined with this function to keep the email payload small.
- Microsoft Docs: [Authorize with Shared Key](https://learn.microsoft.com/en-us/rest/api/storageservices/authorize-with-shared-key) — signing scheme used by the helper.
- Microsoft Docs: [Create a service SAS](https://learn.microsoft.com/en-us/rest/api/storageservices/create-service-sas) — SAS token format returned in `SASLink`.
