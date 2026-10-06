---
title: Monitor Service Health (Scheduled)
description: Alert by email about new Microsoft 365 service health issues
---

{% hint style="info" %}
This is a scheduled runbook. It is designed to run on a recurring schedule rather than being triggered for a single object. See [Scheduling](../../../scheduling.md) for details on how to configure runbook schedules.
{% endhint %}

## Description
Checks the Microsoft 365 service health feed for issues that Microsoft announced within the chosen number of hours. Each new issue is sent as a separate alert email, with the tenant and issue title in the subject and all details in the body. Monitoring can be limited to certain services, and advisories and already resolved issues can be included. No report files are created.

## Common use cases

- Schedule the runbook to run at or slightly more often than `LookbackHours` to catch every new Service Health issue exactly once.
- Set `Services` to a comma-separated list of service names or short ids (matched case-insensitively) to monitor only specific services, such as Exchange Online or Teams; leave it empty to monitor all services.
- Leave `IncludeAdvisories` and `IncludeResolvedIssues` at their default of `false` for the lowest-noise setup, which alerts only on unresolved incidents; set either to `true` to also surface advisories or issues Microsoft has already marked as resolved.

## Parameter interactions

- An issue counts as newly announced when its first Service Health post falls inside the `LookbackHours` window (falling back to `startDateTime` if the issue has no posts), not by `lastModifiedDateTime` alone. This avoids missing back-dated issues while preventing re-alerts on every status update of an ongoing incident.
- The runbook keeps no state between runs, so a failed or skipped run means those alerts are never sent unless `LookbackHours` is temporarily widened for a catch-up run.
- One email is sent per new issue, so a busy Service Health day can produce several emails per run.

## Run output

Every run writes a summary of the filter stages and the list of new issues, including whether the alert email for each issue was sent, to the **Output Data** tab of the job. No report files are created.

## Setup regarding email sending

Sending an email report is optional and only happens when a recipient (`EmailTo`) is provided. The sender address is taken from the `RJReport.EmailSender` tenant setting.

This runbook sends emails using the Microsoft Graph API. To send emails via Graph API, you need to configure an existing email address in the runbook customization.

See the [RealmJoin Report Settings documentation](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings) for details on all available settings.

### Email branding

The report email honors the optional `RJReport.Branding.*` tenant settings:

- **Header and footer image** – public HTTPS URLs, PNG/JPEG/GIF, max. 200 KB each
- **Footer link** – target of the footer image
- **Accent and text color** – 6-digit hex values, e.g. `#0052cc`

When these settings are not configured, the default RealmJoin graphics and colors are used. An image that cannot be downloaded or validated, or an invalid color value, never prevents the report email – the corresponding default is used instead.

Setup instructions and image requirements: [Email branding](https://docs.realmjoin.com/automation/runbooks/runbook-report-settings#email-branding-optional).


## Location
Organization → General → Monitor Service Health (Scheduled)

**Full Runbook name**

rjgit-org_general_monitor-service-health_scheduled

## Details

| Property | Value |
| --- | --- |
| Version | 1.4.0 |
| Required modules | RealmJoin.RunbookHelper (>= 0.8.9)<br>Microsoft.Graph.Authentication (>= 2.39.0) |
| Schedulable | yes |

## Permissions

### Application permissions
- **Type**: Microsoft Graph
  - Organization.Read.All
    - *Reads /organization to put the tenant name into the alert email subject and footer*
  - ServiceHealth.Read.All
    - *Reads /admin/serviceAnnouncement healthOverviews and issues to detect newly announced service health issues*
  - Mail.Send *(optional — feature: Email report)*
    - *Sends one alert email per newly detected issue via Send-RjRbReportEmail when EmailTo is configured*


## Parameters
### Services

Services to watch, separated by commas, for example Microsoft Intune, Microsoft Entra, Exchange Online. Leave empty for all services. Short names such as Intune work too.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Portal display name | Services to monitor |

### LookbackHours

How many hours back to look for newly announced issues, 1 to 168. Use the same interval as the schedule, for example 24 for a daily run, so nothing is missed or alerted twice.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | 24 |
| Type | Int32 |
| Portal display name | Lookback window (hours) |

### IncludeAdvisories

Also alerts on advisories, not only on incidents.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include advisories? |

### IncludeResolvedIssues

Also alerts on issues Microsoft has already resolved by the time the runbook runs.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value | False |
| Type | Boolean |
| Portal display name | Include resolved issues? |

### EmailFrom

Sender address of the alert email. Taken from the tenant setting RJReport.EmailSender.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingHeaderImageUrl

Header image of the report email (HTTPS URL, PNG/JPEG/GIF, max 200 KB). Taken from the tenant setting RJReport.Branding.HeaderImageUrl; the default RealmJoin header is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterImageUrl

Footer image of the report email (HTTPS URL, PNG/JPEG/GIF, max 200 KB). Taken from the tenant setting RJReport.Branding.FooterImageUrl; the default RealmJoin footer is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingFooterLink

Link behind the footer image of the report email. Taken from the tenant setting RJReport.Branding.FooterLink; realmjoin.com is used when empty.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingAccentColor

Accent color of the report email as a 6-digit hex value. Taken from the tenant setting RJReport.Branding.AccentColor; the RealmJoin default is used when empty or invalid.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### BrandingTextColor

Text color of the report email as a 6-digit hex value. Taken from the tenant setting RJReport.Branding.TextColor; the RealmJoin default is used when empty or invalid.

| Property | Value |
| --- | --- |
| Required | false |
| Default Value |  |
| Type | String |
| Hidden in portal | yes (preset via runbook customization) |

### EmailTo

Addresses that receive the alert emails, separated by commas. At least one is required.

| Property | Value |
| --- | --- |
| Required | true |
| Default Value |  |
| Type | String |
| Portal display name | Recipient email address(es) |



[Back to Runbook Reference overview](../../README.md)

