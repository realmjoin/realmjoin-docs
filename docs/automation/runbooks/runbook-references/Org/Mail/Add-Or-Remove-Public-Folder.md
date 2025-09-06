# Add Or Remove Public Folder

Add or remove a public folder.

## Description

Assumes you already have at least on Public Folder Mailbox. It will not provision P.F. Mailboxes.

## Location

Org &rarr; Mail &rarr; Add Or Remove Public Folder

## Permissions

### API Permissions

**Office 365 Exchange Online**
- Exchange.ManageAsApp

### Required Roles

- Exchange administrator

## Parameters

### -PublicFolderName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _1_ |

### -MailboxName

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _false_ |
| Position | _2_ |

### -AddPublicFolder

| Name | Value |
|---|---|
| Type | _Boolean_ |
| Default Value | _False_ |
| Required | _true_ |
| Position | _3_ |

### -CallerName

**Description:** CallerName is tracked purely for auditing purposes 

| Name | Value |
|---|---|
| Type | _String_ |
| Default Value | _None_ |
| Required | _true_ |
| Position | _4_ |


