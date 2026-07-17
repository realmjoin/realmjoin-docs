---
type: Deployment Guide
description: Provision multi-user devices with RealmJoin Agent-based software deployment.
---

# Multi User Devices

This article describes the approach for deploying and managing **Intune Multi-User Devices** using **Windows Autopilot Self-Deployment** combined with a **RealmJoin DEM (Device Enrollment Manager) account**.

The concept allows administrators to:

* Provision devices **without assigning** a real **user** during **Autopilot/Intune enrollment**
* Use a dedicated **RealmJoin DEM account** to establish the **Primary User**
* **Deploy packages** and ensure that updates are applied reliably on shared devices

## Concept

* Deploy the device using **Windows Autopilot Self-Deployment Mode** - this completes Autopilot provisioning without a user assigned.
* **Sign in initially** using a dedicated **RealmJoin DEM account**.
  * The DEM account is identified through a dedicated group that is marked as a special Multi-User Device account type in the RealmJoin database.
* RealmJoin automatically sets this DEM account as the **Primary User** of the device.
* **Assign** required **RealmJoin packages** using one of the supported assignment methods to make them available all users on the shared device.

## Requirements

### Intune Autopilot Enrollment

Choose deployment mode "Self-Deploying" for enrolling those shared devices:

<figure><img src="../../.gitbook/assets/image (268).png" alt=""><figcaption></figcaption></figure>

### RealmJoin DEM account (or multiple)

Create a corresponding service account. The account:

* Must be licensed appropriately (e.g. Intune License)
* Must remain available for the lifetime of the shared devices
* Should be added to the following dedicated DEM group

### RealmJoin DEM Group

Create a dedicated group **containing all DEM accounts** to represent shared device enrollment accounts.

{% hint style="info" %}
Once created, please send the **Object ID** of the group to our **RJ support**. We will flag this special group in our backend.
{% endhint %}

### Package Assignment Options

Both options will **automatically change** the **default Script Restrictions** - so that, **secondary users** can **install/update software packages** **assigned** to the **shared device or DEM user**.

#### Option A: Assign Packages to Devices

Packages are **assigned directly to devices** (e.g. put a shared device in corresponding RJ app group).

{% hint style="info" %}
Please ask RJ support, if **device assignment feature** is active in your tenant.
{% endhint %}

#### Option B: Assign Packages to DEM Users

Packages can alternatively be **assigned directly to the DEM user account**. Secondary users will automatically inherit assigned software. For this, a DEM account per use-case might be useful.

## Recommendations

### Package Settings

{% hint style="info" %}
Because multi-user devices are typically used for relatively short sessions, the opportunity to perform package installations and updates during regular operation is limited. To **ensure** that **software deployments and updates** are **processed** as **quickly** and **reliably** as possible, we **strongly recommend** applying the following **settings**.

You can scope them to the **RealmJoin DEM group**.
{% endhint %}

| Setting                                            | Value  | Description                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SoftwarePackageOverrides.AllowBackgroundInstall`  | `true` | Executes **package updates/installations directly** after **config updates**.                                                                                                           |
| `SoftwarePackageOverrides.IgnorePhaseRestrictions` | `true` | Overrides package phase restrictions and enables all phases, including **Logon**. This allows pending software installations and updates to be processed **directly after user logon**. |

Reference: [#global-override-of-software-package-behavior](../../ugd-management/user-and-group-settings/additional-settings.md#global-override-of-software-package-behavior "mention")

## Enrollment Flow

{% stepper %}
{% step %}
### Preparations

* [ ] Setup Autopilot "Self-Deploying" enrollment
* [ ] Create RealmJoin DEM account
* [ ] Create RealmJoin DEM group
* [ ] Contact RJ support
  * [ ] to mark "RealmJoin DEM group"
  * [ ] verify that device assignment feature is active in your tenant
* [ ] Assign desired packages
{% endstep %}

{% step %}
### Autopilot Self-Deploying

Device starts Autopilot enrollment  - the Intune Enrollment Status Page (ESP) runs through phases:

* Device preparation: e.g. Entra Join and Intune Onboarding
* Device setup: **RealmJoin agent** has to be **installed in that phase**
{% endstep %}

{% step %}
### Windows Sign-in

Windows waits for the first user sign-in. At this stage, the **dedicated RealmJoin DEM account must be used to log on**. RealmJoin will automatically detect the account and **assign** it as the **device's Primary User**.

{% hint style="info" %}
Do not log on with another account than the DEM account. This would result in a wrong primary user assignment and multi-user device logic will not function.
{% endhint %}
{% endstep %}

{% step %}
### Autopilot completes

Rest of Autopilot enrollment runs through.
{% endstep %}

{% step %}
### Deployment of Packages

RealmJoin starts initial phase and **deploys software assigned** to the **DEM account and/or shared device**.
{% endstep %}

{% step %}
### Device is ready for other users

Other users log-in. **Software** assigned to the DEM is **inherited** to them and packages assigned to the **device** are available, too.
{% endstep %}
{% endstepper %}
