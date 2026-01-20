# FAQ

## Which links should I bookmark?

*   RealmJoin Portal:

    [https://portal.realmjoin.com](https://portal.realmjoin.com)
*   Public Runbook Repository:

    [https://github.com/realmjoin/realmjoin-runbooks](https://github.com/realmjoin/realmjoin-runbooks)
*   General RealmJoin website:

    [https://realmjoin.com/](https://realmjoin.com)
*   Documentation:

    [https://docs.realmjoin.com/](https://docs.realmjoin.com)

## Am I able to maintain my own software packages and updates?

RealmJoin contains an internal application store compatible with Intunewin (Microsoft Endpoint Manager / Intune Package Format), with over 3000 existing applications. RealmJoin offers packaging-as-a-service to provide any missing applications.

As RealmJoin directly leverages Microsoft Intune, it is possible to offer additional applications which are maintained independently by your organization next to applications sourced through our application store.

## Am I able to maintain my own runbooks?

RealmJoin offers a [public repository of runbooks](https://github.com/realmjoin/realmjoin-runbooks). These runbooks are improved and updated continuously and build the foundation of what we think are everyday routine tasks in a modern workplace environment. As such, these runbooks are automatically synced into a RealmJoin environment as part of our service.

RealmJoin leverages standard Azure Automation features to host these shared runbooks. They will be stored using a `rjgit-` prefix in your Azure Automation Account. You can simply add custom runbooks without this prefix to the same Azure Automation account. If the runbooks adhere to our naming scheme, RealmJoin Portal will present your custom runbooks in the same way as our shared ones.

See [Runbook naming scheme](../automation/runbooks/naming-conventions.md)

## What cost to expect from Azure Resources?

RealmJoin utilises the customers Azure instance for [Log Analytics](../logs/log-analytics.md) and[ Key Vault](../realmjoin-agent/realmjoin-client/local-admin-password-solution-laps/keyvault.md). Microsoft bills the cost for traffic directly to the customer, currently 2.8€ per GB.&#x20;

From our experience over several customers, we estimate it takes 250 to 500 tenant users to reach 1 GB, translating to 2-4 cents/user per month.&#x20;

We will monitor the traffic numbers in the future and update our estimation regularly if necessary.

## Does RealmJoin work with Windows Autopilot for pre-provisioned deployment (formerly: WhiteGlove)?

The compatibility of RealmJoin with Autopilot Pre-Provisioning varies based on the deployment method selected:

1. **Intune-Driven App Deployment**:
   * **Compatibility**: Supported.
   * **Considerations**: Ensure that you meet the [requirements defined by Microsoft](https://learn.microsoft.com/en-us/autopilot/pre-provision) for pre-provisioning. Please note that this method only supports device-context apps that are targeted either to the device itself or to a pre-assigned user.&#x20;
2. **RealmJoin Agent-Driven App Deployment**:
   * **Compatibility**: Not supported.
   * **Recommendation**: In this scenario, it is possible to use a Temporary Access Pass (TAP). This method allows to enroll a device on behalf of a user what includes the whole Intune and RealmJoin deployment phases.
3. **Mix of Intune- and RealmJoin Agent-Driven App Deployment:**
   * **Compatibility:** Possible, but not recommended.
   * The RealmJoin Agent can detect applications installed via Intune-driven app deployment. However, for successful recognition, the packages must match exactly (such as argument hashes, version number). This approach adds complexity, as applications need to be maintained two times and assignment logic becomes more intricate.

## Backend Testing

Backend testing is conducted across two primary components: the Portal and the Agent. Each component utilizes multiple deployment channels to ensure thorough validation before reaching production environments.

### Portal Testing

The portal testing infrastructure consists of three environments with progressive stability levels:

**Developer Hosted Instances**

* Individual development environments for initial feature development and rapid iteration

**Staging Portal**

* Central testing environment where newly developed features are deployed
* Publicly accessible but should be used with caution due to frequent changes
* Serves as both a formal testing environment and daily-use platform for the RealmJoin team
* Real-world usage patterns help surface issues before production deployment

**Productive Portal**

* Production environment serving end users
* Receives batched releases of multiple tested features from staging

### Agent Testing

The agent utilizes a three-channel release strategy:

**Canary Channel**

* Bleeding-edge releases used by the internal development team
* Enables rapid internal feedback on new functionality

**Beta Channel**

* Company-wide release channel deployed across the organization
* Balances feature currency with reasonable stability

**Stable Channel**

* Production-ready release channel with thoroughly tested features
* Recommended for general use with maximum stability

All three agent channels are publicly available to customers for testing at their preferred stability level and evaluating upcoming features in their own environments.
