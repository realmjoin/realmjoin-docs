# Licensing

{% hint style="success" %}
The subscription for RealmJoin is **user-based**.
{% endhint %}

## User Definition

### Definitions

* **Tenant**: The Microsoft 365 tenant associated with the applicable RealmJoin instance.
* **Intune User License Seat**: A user‑based Microsoft Intune entitlement purchased and present in the Tenant, whether as a standalone Intune license (e.g., Microsoft Intune Plan 1) or included within a Microsoft suite that confers Intune rights (e.g., Microsoft 365 E3/E5, EMS E3/E5, Business Premium, F1/F3).
* **Subscription Term**: The invoicing period applicable to the RealmJoin subscription (e.g. monthly or annual).

### Counting Rule

* **Requirement**: One RealmJoin User subscription is required for each Intune User License Seat in the Tenant.
* **Measurement**: The User quantity for RealmJoin equals the maximum number of Intune User License Seats present in the Tenant at any time during the Subscription Term, regardless of assignment to users.
* The **minimum amount of users** that can be subscribed for one organization is 1,000.

{% hint style="info" %}
RealmJoin does not display your license consumption. Please ensure compliance with the licensing terms by monitoring the Intune subscriptions in your tenant on a regular basis.
{% endhint %}

## Device Limits per User

One single user may be assigned to up to 10 devices.

## Subscription Scope

A RealmJoin subscription may be used for the clients and users of **one** organization.&#x20;

It is **not** allowed to&#x20;

* Use one RealmJoin subscription for multiple organizations
* Split one RealmJoin subscription and/or re-sell it to multiple organizations

## RealmJoin Editions

You can choose between two RealmJoin editions:

* RealmJoin **Apps**
* RealmJoin **Enterprise**

The following table shows an overview of the scope of the two editions. RealmJoin is a continuously evolving Software-as-a-Service. We therefore reserve the right to add, change and remove features from plans without any further notice.

| Feature                                                                                              |             RealmJoin Apps            |          RealmJoin Enterprise         |
| ---------------------------------------------------------------------------------------------------- | :-----------------------------------: | :-----------------------------------: |
| Application Store                                                                                    | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| Application Lifecycle                                                                                | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| Request [generic apps](../../app-management/packages/package-store/#generic-packages)                | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| Request [custom apps](../../app-management/packages/package-store/#custom-package)                   |                 Add-on                |                 Add-on                |
| Deploy Binaries (Organics)                                                                           | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| App Agent                                                                                            | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| Multi-user support                                                                                   | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| VDI support                                                                                          | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| <p><a href="../../app-management/avd-templates.md">AVD templates support</a><br>(headless agent)</p> |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Software Inventory                                                                                   |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Supporter Insights & Device Warranty                                                                 |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| [RealmJoin API](../../dev-reference/realmjoin-api/)                                                  |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Supporter Runbooks                                                                                   |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Scheduled Runbooks                                                                                   |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Supporter Permissions (RBAC)                                                                         |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Advanced Custom Telemetry                                                                            |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| LAPS                                                                                                 |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Unintended Local Admin Monitoring (ULAM)                                                             |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Secondary Identity and Metadata                                                                      |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| User Notification & Alerting                                                                         |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Remote Support Agent Integration (Anydesk)\*                                                         |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Enhanced & Reliable Autopilot ESP                                                                    |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Autopilot Manager                                                                                    |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |
| Corporate Forms                                                                                      |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |

\*The Anydesk license is not included in the RealmJoin subscription. To subscribe to Anydesk, please refer to [https://anydesk.com](https://anydesk.com/).

## Software Package Licensing

The software packages provided in the RealmJoin App Store contain licensing information for the software. This information is for informational purposes only and is not binding.&#x20;

The RealmJoin subscription fee does not include licensing for the software applications contained in the packages.

Customers/Users of the RealmJoin software packages are required to inform themselves about the respective licensing terms of the software applications in the packages and to license them accordingly before deployment.

In general, we assume no liability for any damages that may arise from the software packages we create or the software contained therein. We recommend that customers test all software packages before deployment.

## Custom Packaging

Customers have the option to request **custom software packages**. These packages are stored in a **private app store**, accessible only to the requesting customer’s organization and not visible in the public app store. The main use case for custom packages are packages, that are not meant to be publicly available or contain proprietary information that can not be externalized by parameters.

Please note that requesting custom packages is not included in the standard subscription fee. To enable this feature, customers must purchase a **RealmJoin Custom Packaging Contingent**. Two contingent sizes are available:

* 5 Custom Packaging Credits
* 10 Custom Packaging Credits

Each new custom package consumes 1 credit, while an update to an existing package consumes 0.5 credits. Custom Packaging Contingents are one-time purchase items. Once a contingent is fully used, a new contingent must be purchased to continue requesting custom packages.
