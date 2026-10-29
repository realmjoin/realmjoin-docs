---
type: Analyze & Export
description: >-
  Query rules, operators and all searchable columns with their aliases for
  Advanced Search in the Users, Groups, Devices and Packages tables.
---

# Advanced Search Syntax

## Query Rules

A query consists of plain search terms and column filters, separated by spaces. The rules:

* **Tokenized Search**:\
  Search terms are automatically tokenized to improve matching accuracy. For example, typing `lu sk` will match names like **Luke Skywalker**. The search always uses a **starts-with** approach rather than a full-text or "contains" search. This means a search for `walk` would **not** return **Skywalker**.
* **Logical AND**:\
  All filters are combined using logical **AND**. Every condition must be met.\
  Example: `Luke Skywalker country:france` searches for Luke Skywalker where the **country** starts with "france".
* **Column-specific Search**:\
  Use `column:` to search within a specific column.\
  Example: `country:france` searches for entries where the **country** starts with "france".
* **Operators**:
  * `:` → **startsWith** search\
    Example: `name:jo` matches "John", "Joanna", etc.
  * `=` → **equals** search\
    Example: `city=Stuttgart` matches exactly "Stuttgart"
  * `!=` or `!:` → **negation**\
    Example: `city!=Stuttgart` excludes exactly "Stuttgart", `city!:Stutt` excludes every city starting with "Stutt". Both also exclude entries where the column is empty.
* **Special Behavior**:
  * **Umlaut substitution**:\
    Umlauts are normalized in plain search terms (e.g., **Björn** can be found by searching for **Bjorn**). Column-specific searches don't normalize umlauts, so use `city:München` rather than `city:Munchen`.
  * **Unicode support**:\
    Unicode characters are supported in search terms.
  * **Brackets () are ignored** in startsWith searches.
  * **Empty value search**:
    * `zip:""` searches for empty values
    * `zip:` searches for any value
* **Supported Columns**:\
  See [Supported Columns](#supported-columns) for every column and alias you can search.

## Supported Columns

Every table below lists the columns you can use in a column-specific search (`column:value`). You can use either the column name or one of its aliases, and upper and lower case don't matter, so `upn:`, `UPN:` and `userPrincipalName:` all search the same column.

{% hint style="warning" %}
If RealmJoin doesn't recognize a column name, that part of the query is ignored and the remaining filters still apply. If your results look unfiltered, check the column name for typos.
{% endhint %}

The **Type** column tells you which values a column accepts:

* **Text**: `:` matches values that start with your input, `=` matches the whole value. Case doesn't matter.
* **Yes/No**: use `true` or `false`, for example `enabled:false`. `:` and `=` behave the same here.
* **Number**: use `=` for an exact value, for example `installFailedDeviceCount=0`. With `:`, a number matches every value that starts with the same digits, so `installFailedDeviceCount:1` also matches 10 or 12.
* **Code**: the value is stored as a number. The codes are listed next to the column.
* **Date**: dates are stored in UTC as `YYYY-MM-DD hh:mm:ss`. Search with the beginning of a date, for example `created:2025` for the whole year or `created:2025-03-14` for one day. Comparisons such as "before" or "after" a date aren't supported.
* **ID**: an Entra object ID (GUID). Use `:` with the beginning of the ID, or paste a complete ID on its own (without a column name) to find that object directly. In the Devices table, a pasted ID is matched against the device ID.
* **Multi-value**: the column holds several values separated by spaces. See [Multi-value columns](#multi-value-columns).

A plain search term without a column name only searches some of the text columns. They are listed under each table.

### Users

| Column | Aliases | Type | Description |
| --- | --- | --- | --- |
| `id` | | ID | Entra object ID |
| `displayName` | `name` | Text | Display name |
| `userPrincipalName` | `upn` | Text | User principal name |
| `mail` | | Text | Primary email address |
| `givenName` | `firstName`, `first` | Text | First name |
| `surname` | `lastName`, `last` | Text | Last name |
| `jobTitle` | `job`, `title` | Text | Job title |
| `department` | `dept` | Text | Department |
| `city` | | Text | City |
| `postalCode` | `postcode`, `zip`, `plz` | Text | Postal code |
| `country` | | Text | Country, as entered in Entra |
| `usageLocation` | `location` | Text | Usage location (two-letter country code, for example `DE`) |
| `preferredLanguage` | `language`, `lang` | Text | Preferred language, for example `de-DE` |
| `accountEnabled` | `enabled` | Yes/No | Whether the account is enabled |
| `userType` | `type` | Code | `1` = Member, `2` = Guest, `0` = Unknown |
| `createdDateTime` | `created` | Date | When the account was created |

Plain search terms match the display name, mail, UPN, first name, last name, job title, department, city, country and usage location.

### Groups

| Column | Aliases | Type | Description |
| --- | --- | --- | --- |
| `id` | | ID | Entra object ID |
| `displayName` | `name` | Text | Group name |
| `description` | `desc` | Text | Description |
| `createdDateTime` | `created` | Date | When the group was created |
| `expirationDateTime` | `expiration` | Date | When the group expires (Microsoft 365 groups with an expiration policy) |
| `isTeamsEnabled` | `teams` | Yes/No | Whether the group is a team |
| `isSecurity` | `security` | Yes/No | Whether the group is a security group |
| `isStatic` | `static` | Yes/No | `true` for assigned membership, `false` for dynamic membership |
| `isRealmJoin` | `realmJoin`, `rj` | Yes/No | Whether the group is a RealmJoin group |
| `isOnPremises` | `onPremises`, `onPrem` | Yes/No | Whether the group is synced from on-premises |

Plain search terms match the group name and description.

### Devices

| Column | Aliases | Type | Description |
| --- | --- | --- | --- |
| `id` | | ID | Entra object ID |
| `deviceId` | | ID | Device ID |
| `displayName` | `name` | Text | Device name |
| `operatingSystem` | `os` | Text | Operating system as shown in the table, for example `Windows 11 (24H2)` |
| `operatingSystemFamily` | `osFamily`, `family`, `osFam`, `fam` | Code | `1` = Windows, `2` = macOS, `3` = Linux, `4` = Android, `5` = iOS, `6` = iPadOS, `7` = Printer, `8` = Other, `0` = Unknown |
| `operatingSystemVersion` | `osVersion`, `osVer` | Text | Operating system version number |
| `manufacturer` | `manu` | Text | Manufacturer |
| `model` | | Text | Model |
| `serialNumber` | `serial`, `sn` | Text | Serial number |
| `accountEnabled` | `enabled` | Yes/No | Whether the device is enabled in Entra |
| `isCompliant` | `compliant`, `compliance` | Yes/No | Whether the device is compliant |
| `createdDateTime` | `created` | Date | When the device was registered |
| `lastSeen` | `last` | Date | Last activity: reported by the RealmJoin agent if installed, otherwise the approximate last sign-in from Entra |
| `version` | `rjVersion`, `ver`, `rj` | Text | Installed RealmJoin agent version (empty without the agent) |
| `intuneLastSyncDateTime` | `intuneSync`, `intuneLastSync`, `lastSync` | Date | Last Intune sync |
| `registeredOwnerDisplayName` | `ownerDisplayName`, `ownerName`, `owner` | Text | Display name of the registered owner |
| `registeredOwnerUserPrincipalName` | `ownerUserPrincipalName` | Text | UPN of the registered owner |
| `registeredOwnerId` | `ownerId` | ID | Object ID of the registered owner |
| `ethernetMacAddress` | `ethMac`, `ethernetMac` | Text | Ethernet MAC address reported by Intune |
| `wiFiMacAddress` | `wifiMac`, `wlanMac` | Text | Wi-Fi MAC address reported by Intune |
| `macAddresses` | `mac`, `macAddress` | Multi-value | All known MAC addresses: Intune Ethernet and Wi-Fi plus every network adapter reported by the RealmJoin agent |

Plain search terms match the device name, operating system, OS version, manufacturer, model, serial number, owner name, owner UPN and MAC addresses.

You can enter MAC addresses with or without separators (`:`, `-` or `.`), for example `mac:E8-62-BE` or `mac:E862BE`.

### Packages

| Column | Aliases | Type | Description |
| --- | --- | --- | --- |
| `id` | | Text | App or package ID |
| `displayName` | `name` | Text | App name |
| `packageId` | `package`, `pkg` | Text | Package ID |
| `type` | | Code | `1` = RealmJoin (legacy), `2` = Intune (unmanaged), `3` = Intune (basic), `5` = Intune (managed), `6` = RealmJoin (basic), `7` = RealmJoin (managed) |
| `subtype` | | Text | App subtype as shown in the table |
| `version` | | Text | Version |
| `preview` | | Yes/No | Whether the package is a pre-release package (deprecated) |
| `statusLatestVersion` | | Text | Latest version available in the app store |
| `statusCurrentPreviewVersion` | | Text | Version currently in preview |
| `statusUpgradeAction` | | Code | Available upgrade action: `0` = none, `1` = upgrade main app, `2` = upgrade preview app, `4` = create preview app, `8` = apply preview to main. Combined actions add up, for example `3`. |
| `statusUpgradeActionPlanned` | | Code | Planned upgrade action, same codes as `statusUpgradeAction` |
| `statusUpgradeActionSchedule` | | Date | When the planned upgrade action runs |
| `automationAutoDeployMain` | | Yes/No | Automatic deployment of the main app |
| `automationAutoDeployPreview` | | Yes/No | Automatic deployment of the preview app |
| `notifyTechnicalApplicationOwners` | | Yes/No | Whether technical application owners are notified |
| `technicalApplicationOwners` | | Text | Technical application owners, separated by `;` |
| `installSource` | | Text | Source of the install numbers: `RealmJoin` or `Intune` |
| `installInstalledDeviceCount` | | Number | Devices with the app installed |
| `installFailedDeviceCount` | | Number | Devices with a failed installation |
| `installPendingDeviceCount` | | Number | Devices with a pending installation (Intune only) |
| `installNotInstalledDeviceCount` | | Number | Devices without the app (Intune only) |
| `installFailureScore` | | Number | Failure score of the app's installations |
| `installSyncedAt` | | Date | When the install numbers were last updated |

Plain search terms match the app name, type, subtype and package ID.

The columns `versionParsed`, `statusLatestVersionParsed`, `statusCurrentPreviewVersionParsed`, `order` and `preReleasePartnerId` are also searchable but hold internal values. Use the columns above instead.

### Multi-value columns

A multi-value column holds several values separated by spaces. Currently this is `macAddresses` (`mac`) in the Devices table.

In these columns, the operators `:`, `=`, `!:` and `!=` check each value on its own, not the column as a whole:

* `mac:E862` finds devices where **any** MAC address starts with `E862`.
* `mac=E862BE0A1B2C` finds devices where **any** MAC address is exactly `E862BE0A1B2C`.
* `mac!:E862` finds devices where **no** MAC address starts with `E862`.
* `mac!=E862BE0A1B2C` finds devices where **no** MAC address is exactly `E862BE0A1B2C`.
