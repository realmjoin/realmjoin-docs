---
type: Analyze & Export
description: >-
  Export Data of queried tables to perform filtering and analysis with your
  tenant data
---

# Data Export

RealmJoin introduces an export functionality which enables you to work with your tenant data outside of the portal.&#x20;

## General Exporting

You can query the User, Group, Device and Package tables for your requested data and generate an OpenXML file containing the queried data with all columns.&#x20;

Simply go to a table, perform your search and press the download button in the top right corner:

<figure><img src="../.gitbook/assets/image (33) (1).png" alt=""><figcaption></figcaption></figure>

## Export Use Case: Software Report

You can query for specific software and packages in the [software report](https://portal.realmjoin.com/softwarereport/all) and get a resulting table of users or devices with the different installed versions.&#x20;

Clicking on an entry in the "Devices" or "Users" column will result in a pre-filtered table-view which can be easily exported via the export button shown in the screenshot above.&#x20;

This enables you to do evaluations on installed software and identify Devices and Users with outdated versions.&#x20;

<figure><img src="../.gitbook/assets/image (34) (1).png" alt=""><figcaption><p>Overview of installed versions of Git for Windows</p></figcaption></figure>

{% hint style="info" %}
Find more information about Software Reporting with RealmJoin in the [Software Reporting Section](software-reporting.md).
{% endhint %}

## Predefined Dataset Exports

In addition to ad-hoc table exports, RealmJoin Portal offers one-click Excel (.xlsx) downloads of key datasets for reporting and auditing. You will find the **General Data Export** section in the portal navigation. Each export is available as a one-click download.

<figure><img src="../.gitbook/assets/image (356).png" alt=""><figcaption><p>Export section in the RealmJoin portal</p></figcaption></figure>

### Available Exports

#### Device Export

Exports all devices in your environment with the following columns:

| Column                | Description                             |
| --------------------- | --------------------------------------- |
| Device Name           | Name of the device                      |
| Owner                 | Device owner                            |
| Owner UPN             | Owner's User Principal Name             |
| Primary User (RJ)     | Primary user as determined by RealmJoin |
| Operating System      | Installed operating system              |
| Manufacturer          | Hardware manufacturer                   |
| Model                 | Device model                            |
| CPU                   | Processor name                          |
| CPU Speed (GHz)       | Processor clock speed                   |
| RAM (GB)              | Installed memory                        |
| Disk (GB)             | Disk capacity                           |
| Last Seen             | Timestamp of last activity              |
| Compliant             | Compliance state                        |
| Enabled               | Whether the device is enabled           |
| RJ Version            | Installed RealmJoin client version      |
| Office Version        | Installed Microsoft Office version      |
| Office Update Channel | Configured Office update channel        |
| First Seen            | Timestamp of first appearance           |
| Serial Number         | Hardware serial number                  |
| Intune Last Sync      | Last sync timestamp with Intune         |

#### Package Export

Exports all subscribed packages with the following columns:

| Column              | Description                                 |
| ------------------- | ------------------------------------------- |
| Package Name        | Display name of the package                 |
| Package ID          | Unique package identifier                   |
| Coordinator         | Assigned coordinator                        |
| Platform            | Target platform                             |
| Version             | Currently deployed version                  |
| Auto Upgrade        | Whether automatic upgrades are enabled      |
| Allow Reinstall     | Whether reinstallation is allowed           |
| Group Name          | App category                                |
| Depends On          | Dependency on other packages, e.g. runtimes |
| Auto Deploy Main    | Auto-deployment state for the main ring     |
| Auto Deploy Preview | Auto-deployment state for the preview ring  |
| Latest Version      | Most recent available version               |
| Technical Owners    | Assigned technical owners                   |
| Maintained          | Whether the package is actively maintained  |

#### Package Restrictions

Exports all packages with their expert settings (restriction configuration) across deployment rings:

| Column          | Description                                           |
| --------------- | ----------------------------------------------------- |
| Package Name    | Display name of the package                           |
| Package ID      | Unique package identifier                             |
| Coordinator     | Assigned coordinator                                  |
| Platform        | Target platform                                       |
| Main: Normal    | Main script – normal restriction                      |
| Main: Initial   | Main script – initial restriction                     |
| Main: Manual    | Main script – manual restriction                      |
| Main: Logon     | Main script – logon restriction                       |
| Main: Primary   | Main script – primary restriction                     |
| Main: Secondary | Main script – secondary restriction                   |
| Has User Part   | Whether the package includes a user-context component |
| User: Normal    | User script – normal restriction                      |
| User: Initial   | User script – initial restriction                     |
| User: Manual    | User script – manual restriction                      |
| User: Logon     | User script – logon restriction                       |
| User: Primary   | User script – primary restriction                     |
| User: Secondary | User script – secondary restriction                   |

#### Antivirus Export

Exports antivirus status information across all devices:

| Column              | Description                                            |
| ------------------- | ------------------------------------------------------ |
| OS                  | Operating system                                       |
| OS Version          | Operating system version                               |
| Device Name         | Name of the device                                     |
| Client ID           | RealmJoin client identifier                            |
| AAD Device ID       | Entra ID (Azure AD) device identifier                  |
| Product Name        | Antivirus product name                                 |
| Is Defender         | Whether the product is Microsoft Defender              |
| Evaluated State     | RealmJoin's evaluated protection state                 |
| Raw State           | Raw antivirus state as reported                        |
| Last Signed-in User | Last user who signed in on the device                  |
| User ID             | User identifier                                        |
| User Is Local Admin | Whether the last signed-in user has local admin rights |
| Last Seen           | Timestamp of last activity                             |
| RJ Version          | Installed RealmJoin agent version                      |

#### Shadow IT

Exports Windows software found on devices that was **not** installed via RealmJoin, aggregated per product with device and user counts. It also includes a best-effort match against your assigned Intune apps, to help you spot software that could be brought under management:

| Column           | Description                                                            |
| ---------------- | --------------------------------------------------------------------- |
| Type             | Software type / source (e.g. `Windows: Appx`)                         |
| Name             | Product name                                                          |
| Publisher        | Publisher, taken from the software's signing certificate subject      |
| Known as         | Normalized / friendly product name, when RealmJoin can map one        |
| Versions         | Number of distinct versions found across all devices                  |
| Devices          | Number of devices the product was found on                           |
| Users            | Number of users associated with those devices                        |
| Installations    | Total number of installations found                                   |
| Intune App Match | Whether the product could be matched to an assigned Intune app (best-effort) |

{% hint style="info" %}
The data in these exports is sourced from the RealmJoin agent and Intune and combined into the individual reports. Future iterations may include additional information; changes will be posted in the changelog and reflected in this documentation.
{% endhint %}
