---
title: Report License Assignment (Scheduled)
description: Generate and email a license availability report based on thresholds
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
This runbook checks the license availability based on the transmitted SKUs and sends an email report if any thresholds are reached.
Two types of thresholds can be configured. The first type is a minimum threshold, which triggers an alert when the number of available licenses falls below a specified number.
The second type is a maximum threshold, which triggers an alert when the number of available licenses exceeds a specified number.
The report includes detailed information about licenses that are outside the configured thresholds, exports them to CSV and/or Excel (xlsx) files, and sends them via email.
The report files can also be uploaded to an Azure Storage Account, returning time-limited download links.
The ReportFileFormat parameter controls which file formats are generated and delivered (CSV only, CSV & XLSX, or XLSX only).
When the CSV attachment exceeds the email size limit and "CSV & XLSX" is selected, the email falls back to the Excel workbook alone.

## Runbook Customization

### Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings: a custom header image, a custom footer image (public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each), a custom footer link, and custom accent and text colors (6-digit hex values, e.g. `#0052cc`). When these settings are not configured, the default RealmJoin graphics and colors are used. A branding image that cannot be downloaded or validated, or a color value that is not a valid hex color, never prevents the report email - the corresponding default is used instead.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for setup details.

### InputJson Configuration

Each license configuration requires:

- **SKUPartNumber** (required): Microsoft SKU identifier
- **FriendlyName** (required): Display name
- **MinThreshold** (optional): Alert when available licenses < threshold
- **MaxThreshold** (optional): Alert when available licenses > threshold

At least one threshold must be set per license.

### Configuration Examples

**Minimum threshold only** (prevent shortages):

```json
[
    {
        "SKUPartNumber": "ENTERPRISEPACK",
        "FriendlyName": "Microsoft 365 E3",
        "MinThreshold": 50
    }
]
```

**Maximum threshold only** (prevent over-provisioning):

```json
[
    {
        "SKUPartNumber": "POWER_BI_PRO",
        "FriendlyName": "Power BI Pro",
        "MaxThreshold": 500
    }
]
```

**Both thresholds** (maintain range):

```json
[
    {
        "SKUPartNumber": "ENTERPRISEPREMIUM",
        "FriendlyName": "Microsoft 365 E5",
        "MinThreshold": 50,
        "MaxThreshold": 150
    }
]
```

### Complete Runbook Customization

```json
{
    "Settings": {
        "RJReport": {
            "EmailSender": "sender@contoso.com"
        }
    },
    "Runbooks": {
        "rjgit-org_general_report-license-assignment_scheduled": {
            "Parameters": {
                "EmailTo": {
                    "DisplayName": "Recipient Email Address(es)"
                },
                "InputJson": {
                    "Hide": true,
                    "DefaultValue": [
                        {
                            "SKUPartNumber": "SPE_E5",
                            "FriendlyName": "Microsoft 365 E5",
                            "MinThreshold": 20,
                            "MaxThreshold": 30
                        },
                        {
                            "SKUPartNumber": "FLOW_FREE",
                            "FriendlyName": "Microsoft Power Automate Free",
                            "MinThreshold": 10
                        }
                    ]
                },
                "EmailFrom": {
                    "Hide": true
                },
                "CallerName": {
                    "Hide": true
                }
            }
        }
    }
}
```

## Finding SKU Part Numbers

```powershell
Connect-MgGraph -Scopes "Organization.Read.All"
Get-MgSubscribedSku | Select-Object SkuPartNumber, SkuId | Sort-Object SkuPartNumber
```

Common SKUs:

- `ENTERPRISEPACK` - Microsoft 365 E3
- `ENTERPRISEPREMIUM` - Microsoft 365 E5
- `EMS` - Enterprise Mobility + Security E3

## Output

**When violations detected:**

- Console output in job log
- CSV export (`License_Threshold_Violations.csv`)
- Email report with summary, violations, recommendations, and CSV attachment

**When all within thresholds:**

- No email sent
- Job completes successfully

## Troubleshooting

**SKU Not Found**: Verify SKU exists using `Get-MgSubscribedSku`

**Email Not Sent**: Check EmailFrom configuration and Mail.Send permission

**Invalid JSON**: Validate JSON format before configuration

## Migration Note

Legacy `WarningThreshold` automatically maps to `MinThreshold` - old configurations continue to work.


## Location
Organization → General → Report License Assignment (Scheduled)

**Full Runbook name**

rjgit-org_general_report-license-assignment_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.3.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0)<br>Az.Accounts (>= 5.5.2) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
    - *Reads /organization and /subscribedSkus to evaluate license counts against the thresholds*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends the threshold report email via Send-RjReportEmail when EmailTo is configured*


## Parameters
### InputJson

JSON array containing SKU configurations with thresholds. Each entry should include a SKUPartNumber for the Microsoft SKU identifier, a FriendlyName as the display name for the license, an optional MinThreshold specifying the minimum number of licenses that should be available, and an optional MaxThreshold specifying the maximum number of licenses that should be available.

This needs to be configured in the runbook customization

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | Object |
| Hidden in portal | yes (preset via runbook customization) |

### ReportFileFormat

Controls which report file formats are generated and delivered: "CSV only", "CSV & XLSX" (default) or "XLSX only".

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | CSV & XLSX |
| Type | String |
| Portal display name | Report file format |

**Portal options**

| Portal option | Value |
| --- | --- |
| CSV & XLSX |  |
| CSV only |  |
| XLSX only |  |

### CreateDownloadLink

If enabled, the report files are uploaded to an Azure Storage Account and time-limited download links are returned. Disabled by default.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Create a file download link (upload report to storage)? |

**Portal options**

| Portal option | Value |
| --- | --- |
| Yes - upload report and return a download link | true |
| No - do not create a download link | false |

### ContainerName

Storage container name used for the upload. Configured per runbook (not a global RJReport setting).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | report-license-assignment |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### ResourceGroupName

Resource group that contains the storage account. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### StorageAccountName

Storage account name used for the upload. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### LinkExpiryDays

Number of days until the generated download link expires. Sourced from the RJReport tenant settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 6 |
| Type | Int32 |
| Hidden in portal | yes (preset via runbook customization) |

### EmailTo

If specified, an email with the report will be sent to the provided address(es).
Can be a single address or multiple comma-separated addresses (string).

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Recipient Email Address(es) |

### EmailFrom

Sender email address resolved from settings.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingHeaderImageUrl

Optional public HTTPS URL of a custom header image (PNG/JPEG/GIF, max. 200 KB) for the report email.
Sourced from the RJReport.Branding.HeaderImageUrl tenant setting. When empty, the default RealmJoin header graphic is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterImageUrl

Optional public HTTPS URL of a custom footer image (PNG/JPEG/GIF, max. 200 KB) for the report email.
Sourced from the RJReport.Branding.FooterImageUrl tenant setting. When empty, the default RealmJoin footer graphic is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterLink

Optional URL the footer image links to. Sourced from the RJReport.Branding.FooterLink tenant setting.
When empty, the default link (https://www.realmjoin.com) is used.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingAccentColor



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingTextColor



| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |



[Back to Runbook Reference overview](../../README.md)

