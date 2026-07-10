---
description: >-
  RealmJoin's user-based subscription model: how Intune User License Seats are
  counted and the minimum number of subscribed users.
layout:
  width: wide
---

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

* RealmJoin **Apps** — everything you need to deliver and manage applications across your fleet.
* RealmJoin **Enterprise** — the full platform, adding automation, reporting, advanced support and security capabilities on top of **Apps**.

The tables below give an overview of the scope of the two editions, grouped by area. RealmJoin is a continuously evolving Software-as-a-Service. We therefore reserve the right to add, change and remove features from plans without any further notice.

### Application Management

| Feature                                                                             | Description                                                          |             RealmJoin Apps            |          RealmJoin Enterprise         |
| ----------------------------------------------------------------------------------- | ------------------------------------------------------------------- | :-----------------------------------: | :-----------------------------------: |
| Application Store                                                                   | Curated catalog of ready-to-deploy application packages.            | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| Application Lifecycle                                                               | Automatic updates and patching of deployed applications.            | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| Request [generic apps](../../app-management/packages/package-store/#generic-packages) | Deploy standard packages from the public app store.               | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| Request [custom apps](../../app-management/packages/package-store/#custom-package)   | Private packages built for your organization only.                  |                 Add-on                |                 Add-on                |
| Deploy Binaries (Organics)                                                          | Distribute your own binaries and installers.                        | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| RealmJoin Agent                                                                     | Client-side agent that delivers apps and runs device tasks.         | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| Multi-user support                                                                  | Manage devices shared by multiple users.                            | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| VDI support                                                                         | Support for virtual desktop infrastructure environments.            | <mark style="color:green;">Yes</mark> | <mark style="color:green;">Yes</mark> |
| [AVD templates support](../../realmjoin-deployment/infrastructure/avd-templates.md) | Templates for Azure Virtual Desktop (headless agent).               |   <mark style="color:red;">No</mark>  | <mark style="color:green;">Yes</mark> |

### Analytics & Reporting

| Feature                              | Description                                                        |            RealmJoin Apps            |          RealmJoin Enterprise         |
| ------------------------------------ | ----------------------------------------------------------------- | :----------------------------------: | :-----------------------------------: |
| [Software Report](../../analyze-and-export/software-reporting.md) | Inventory and reporting of the software installed in your tenant. | <mark style="color:red;">No</mark> | <mark style="color:green;">Yes</mark> |
| Supporter Insights & Device Warranty | Device details and warranty information for supporters.           | <mark style="color:red;">No</mark> | <mark style="color:green;">Yes</mark> |
| Advanced Custom Telemetry            | Collect and evaluate custom device telemetry.                     | <mark style="color:red;">No</mark> | <mark style="color:green;">Yes</mark> |

### Automation & Integration

| Feature                                          | Description                                                              |            RealmJoin Apps            |          RealmJoin Enterprise         |
| ------------------------------------------------ | ----------------------------------------------------------------------- | :----------------------------------: | :-----------------------------------: |
| [RealmJoin API](../../dev-reference/realmjoin-api/) | Programmatic access to RealmJoin functionality.                      | <mark style="color:red;">No</mark> | <mark style="color:green;">Yes</mark> |
| Automation Tools                                 | [RunBooks](../../automation/runbooks/README.md) and [Remediation Script](../../automation/remediation-scripts.md) integration. | <mark style="color:red;">No</mark> | <mark style="color:green;">Yes</mark> |
| Remote Support Agent Integration (AnyDesk)\*     | Remote-control sessions with end users via AnyDesk.                     | <mark style="color:red;">No</mark> | <mark style="color:green;">Yes</mark> |

### Security & Access

| Feature                                                                     | Description                                                    |            RealmJoin Apps            |          RealmJoin Enterprise         |
| --------------------------------------------------------------------------- | ------------------------------------------------------------- | :----------------------------------: | :-----------------------------------: |
| [Custom Roles](../../realmjoin-settings/permission/custom-roles/README.md)  | Granular, role-based access control (RBAC) for supporters.    | <mark style="color:red;">No</mark> | <mark style="color:green;">Yes</mark> |
| LAPS                                                                        | Local Administrator Password Solution.                        | <mark style="color:red;">No</mark> | <mark style="color:green;">Yes</mark> |

### Support & Communication

| Feature                     | Description                                            |            RealmJoin Apps            |          RealmJoin Enterprise         |
| --------------------------- | ------------------------------------------------------ | :----------------------------------: | :-----------------------------------: |
| User Notification & Alerting | Send notifications and alerts directly to end users.  | <mark style="color:red;">No</mark> | <mark style="color:green;">Yes</mark> |
| Corporate Forms             | Custom self-service forms for your organization.       | <mark style="color:red;">No</mark> | <mark style="color:green;">Yes</mark> |

\*The AnyDesk license is not included in the RealmJoin subscription. To subscribe to AnyDesk, please refer to [https://anydesk.com](https://anydesk.com/).

## Free Trial

You can evaluate RealmJoin free of charge for **30 days**. In most cases you can get started entirely on your own — no sales call required.

{% stepper %}
{% step %}
### Start your trial

Onboard your Microsoft 365 tenant yourself via [realmjoin.com/start-now](https://www.realmjoin.com/start-now/).
{% endstep %}

{% step %}
### Explore the basics

The **basic features** are automatically enabled right after onboarding, so you can start exploring RealmJoin immediately.
{% endstep %}

{% step %}
### Unlock more (optional)

Want to try more? [Contact us](../support.md) to enable additional capabilities for your trial — up to the full **RealmJoin Enterprise** feature set.
{% endstep %}
{% endstepper %}

{% hint style="info" %}
The trial period runs for **30 days**. Reach out to [sales@realmjoin.com](mailto:sales@realmjoin.com) if you have any questions or would like to convert your trial into a subscription.
{% endhint %}

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
