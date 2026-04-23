# General Data Export

RealmJoin Portal allows administrators to export key datasets directly from the portal as Excel (.xlsx) files. This gives you a convenient way to extract and work with your environment's data for reporting, auditing, or further analysis outside of the portal.

You will find the **General Data Export** section in the portal navigation. Each export is available as a one-click download.

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

{% hint style="info" %}
The data in these exports is sourced from the RealmJoin agent and Intune and combined into the individual reports. Future iterations may include additional information; changes will be posted in the changelog and reflected in this documentation.
{% endhint %}
