---
type: Developer Reference
description: Helper functions used by reporting runbooks to deliver results via email or Azure Storage.
---

# Report Functions

This section documents the shared PowerShell helper functions available to RealmJoin reporting runbooks. The functions are part of the **RealmJoin.RunbookHelper** module and implement the delivery channels described in [Runbook Report Settings](../../automation/runbooks/runbook-report-settings.md). They are used by runbooks to send report results to administrators.

| Function | Purpose |
| --- | --- |
| [Send-RjRbReportEmail](send-rjrbreportemail.md) | Sends branded HTML report emails via Microsoft Graph. Converts Markdown content to responsive HTML and delivers one email per recipient. |
| [Publish-RjRbFilesToStorageContainer](publish-rjrbfilestostoragecontainer.md) | Uploads report files to Azure Blob Storage and returns time-limited SAS download links. |
| [Export-RjRbXlsx](export-rjrbxlsx.md) | Exports objects to styled native Excel workbooks (.xlsx) without external module dependencies. Not yet part of the module — planned for the next release. |
