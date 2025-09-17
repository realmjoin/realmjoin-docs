# Licensing

{% hint style="success" %}
The subscription for RealmJoin is **user-based**.
{% endhint %}

## User definition

The subscription of a "user" is required for each Intune subscription, that is assigned to a user in the Microsoft 365 tenant in scope for the RealmJoin instance. The maximum amount of Intune-users in the corresponding subscription term is the required number of users for RealmJoin.

The minimum amount of users that can be subscribed for one organization is 1.000.

{% hint style="info" %}
RealmJoin does not display your license consumption. Please ensure compliance with the licensing terms by monitoring the Intune subscriptions in your tenant on a regular basis.
{% endhint %}

## Device limits per user

One single user may be assigned to up to 10 devices.

## Subscription scope

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
