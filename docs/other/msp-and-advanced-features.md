---
description: >-
  This section covers advanced features designed for Managed Service Providers
  (MSPs) and power users who need enhanced control and flexibility within
  RealmJoin.
---

# MSP & Advanced Features

### Tenant Switcher&#x20;

The Tenant Switcher feature enables MSPs to establish parent-daughter tenant relationships in a 1:N hierarchy, allowing centralized management across multiple customer environments.

#### Overview

With the Tenant Switcher functionality, administrators from a parent tenant can seamlessly switch to any connected daughter tenant and perform administrative tasks using their parent tenant credentials. This eliminates the need to maintain separate accounts for each managed customer.

#### Key benefits

* **Centralized access management**: Maintain a single set of credentials while managing multiple customer tenants
* **Streamlined operations**: Quickly switch between customer environments without logging out
* **Consistent security**: Parent tenant security policies and authentication methods apply across all daughter tenants
* **Audit trail**: All actions performed in daughter tenants are traceable to the parent tenant administrator

#### Setup requirements

To establish parent-daughter tenant relationships:

1. Parent tenant must have MSP licensing enabled
2. **Backend configuration required**: The RealmJoin team must flag the daughter tenant with the parent tenant's handle in the backend system. This configuration must be requested via a separate support ticket or during the initial onboarding process
3. Daughter tenants must explicitly authorize the parent tenant connection
4. Parent tenant administrators need appropriate permissions configured in the parent tenant
5. Each daughter tenant maintains its own data isolation and security boundaries

#### Using the Tenant Switcher

Once configured, authorized administrators will see a tenant switcher control in the RealmJoin Portal interface. Select the target daughter tenant from the dropdown to switch context. Your parent tenant credentials remain active, and all actions are performed with the appropriate permissions within the daughter tenant scope.

<figure><img src="../.gitbook/assets/image (1) (1).png" alt=""><figcaption><p>Step 1: Select the Tenant Switcher in the parent tenant</p></figcaption></figure>

<figure><img src="../.gitbook/assets/image (1) (1) (1).png" alt=""><figcaption><p>Step 2: Select the desired tenant</p></figcaption></figure>

***

### Custom Role permissions

By default, only RealmJoin administrators can use the tenant switcher feature. However, custom roles can be configured to grant tenant switcher access to non-administrator users with limited permissions in the daughter tenants. Common use cases include:

* **Software Requester**: Users who create and manage application packages without full admin rights
* **1st Level Support**: Help desk staff who need limited access to troubleshoot user issues

For detailed information on configuring custom roles, see the [Custom Roles documentation](https://docs.realmjoin.com/realmjoin-settings/permission/custom-roles).

**Note**: Some permissions require RealmJoin staff assistance to configure. Contact support if you need help setting up custom roles with restricted permissions.

***

### Staging Portal

RealmJoin maintains a staging environment for early access to new features and functionality.

#### Overview

The Staging Portal at [**portal-staging.realmjoin.com** ](https://portal-staging.realmjoin.com)serves as a beta environment where upcoming features are deployed before they reach the production portal. This allows users to preview and test new capabilities ahead of general availability.

#### Important considerations

**Use with Caution**: The staging environment is provided as-is without guarantees. Features may be incomplete, unstable, or subject to change. Avoid using production-critical data.

#### Who should use Staging?

The Staging Portal is ideal for:

* Organizations wanting to test new features before deployment
* Users providing feedback on upcoming functionality
* Training and familiarization with future capabilities
* Development and testing scenarios
