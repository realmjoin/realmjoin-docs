---
description: >-
  How to offboard RealmJoin from your tenant, covering both Intune-only and full
  RealmJoin deployments and what tenant deletion means for your data, portal
  access, and devices.
---

# Offboarding

If you decide to stop using RealmJoin, follow the steps below to remove it cleanly from your tenant. The exact steps depend on how RealmJoin is deployed in your environment.

{% hint style="warning" %}
**Remove managed applications first.** Managed the groups  are only deleted automatically when a subscribed package is removed regularly from the portal manually. During tenant deletion we do **not** touch any groups or packages pushed to Intune, so any managed application you no longer need must be deleted in the portal **before** you start offboarding.&#x20;
{% endhint %}

## Intune only

If you use RealmJoin for Intune management only:

{% stepper %}
{% step %}
### Remove RealmJoin from Enterprise Applications

Delete the RealmJoin application from **Enterprise applications** in your Microsoft Entra tenant.
{% endstep %}

{% step %}
### Let us know

[Contact us](../legal/support.md) so we can remove the tenant connection on our side.
{% endstep %}
{% endstepper %}

## RealmJoin Agent deployed

If the RealmJoin Agent is deployed to your devices, complete all of the steps above and, in addition:

{% stepper %}
{% step %}
### Request the clean-up script

[Contact us](../legal/support.md) for a PowerShell script that removes any remaining traces of RealmJoin from your devices.
{% endstep %}
{% endstepper %}

## What tenant deletion means

Once we remove the tenant connection on our side:

* We delete all data we stored for your tenant.
* The RealmJoin Portal can no longer be accessed.
* Devices will no longer receive new configurations for the RealmJoin Agent.

{% hint style="info" %}
Managed groups are **not** removed during tenant deletion. Make sure to delete any groups/applications in Intune you no longer need in the RealmJoin portal before offboarding.
{% endhint %}
