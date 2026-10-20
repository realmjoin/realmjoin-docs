---
type: Deployment Guide
description: Step by step guide on deploying the RealmJoin Portal to a new tenant
---

# Onboarding

## Self-onboard RealmJoin Portal

{% stepper %}
{% step %}
#### Sign in as a Global Admin

Visit [https://portal.realmjoin.com](https://portal.realmjoin.com) and sign in as **Global Admin** of your Entra ID Tenant.

<figure><img src="../../.gitbook/assets/image (41).png" alt=""><figcaption></figcaption></figure>
{% endstep %}

{% step %}
#### Accept Permissions

Select "Consent on behalf of your organization" to approve the RealmJoin Portal on behalf of your organization.

<figure><img src="../../.gitbook/assets/image (42).png" alt=""><figcaption><p>The App will request basic permissions needed to interact with the RealmJoin Portal. These permissions are required for any user interacting with RealmJoin Portal - e.g. to use self-services.</p></figcaption></figure>
{% endstep %}

{% step %}
#### Fill in the form

The nominated email will receive important updates and portal notifications.

<figure><img src="../../.gitbook/assets/Snipaste_2026-01-21_15-07-24.png" alt=""><figcaption></figcaption></figure>
{% endstep %}

{% step %}
#### Select "Quick Setup" or "Advanced Setup"

* **Quick Setup** grants all core and optional RealmJoin Portal permissions with a single admin consent. This is the recommended option for most organizations.
* **Advanced Setup** lets you select the granted permissions individually with the RealmJoin PowerShell module. Choose it if your organization has special compliance needs or requires maximum control over granted permissions.

You can switch from Quick Setup to Advanced Setup later; the switch is one-way. In both setup types, the RealmJoin Client app (required for the RealmJoin Agent) and the security features (Microsoft Defender for Endpoint) are activated separately on the [features page](https://portal.realmjoin.com/organization/features). See [Getting Started](../getting-started/#decision-1-quick-setup-or-advanced-setup) for a side-by-side comparison.

<figure><img src="../../.gitbook/assets/Snipaste_2026-01-21_15-07-54.png" alt=""><figcaption></figcaption></figure>
{% endstep %}
{% endstepper %}

{% content-ref url="advanced-setup.md" %}
[advanced-setup.md](advanced-setup.md)
{% endcontent-ref %}
