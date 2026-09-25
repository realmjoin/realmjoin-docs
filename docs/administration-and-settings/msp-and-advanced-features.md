---
type: Administration & Settings
description: >-
  This section covers advanced features designed for Managed Service Providers
  (MSPs) and power users who need enhanced control and flexibility within
  RealmJoin.
---

# MSP & Advanced Features

### Tenant Switcher

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

Once configured, authorized administrators can access the tenant switcher by clicking on the tenant name in the middle of the top header bar. Select the target daughter tenant from the menu to switch context. Your parent tenant credentials remain active, and all actions are performed with the appropriate permissions within the daughter tenant scope.

<figure><img src="../.gitbook/assets/image (423).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (424).png" alt=""><figcaption></figcaption></figure>

### Custom Role permissions

By default, only RealmJoin administrators can use the tenant switcher feature. However, custom roles can be configured to grant tenant switcher access to non-administrator users with limited permissions in the daughter tenants. Common use cases include:

* **Software Requester**: Users who create and manage application packages without full admin rights
* **1st Level Support**: Help desk staff who need limited access to troubleshoot user issues

For detailed information on configuring custom roles, see the [Custom Roles documentation](permission/custom-roles/).

#### Required permission: `CanAdministerTenantPartners`

Access to the tenant switcher is granted by the custom role permission **`CanAdministerTenantPartners`**. Assign it in the custom roles of the **parent tenant**. Users who hold it can open the tenant switcher and switch into every daughter tenant that is connected to the parent tenant.

In the daughter tenant, these users keep the **pre-defined role they have in the parent tenant** (for example Supporter, Advanced Supporter or Auditor). The tenant switcher only gives them access to the daughter tenant. It does not give them admin rights there. This lets you give support staff access to all customer tenants with exactly the permissions they already have at home, without making them RealmJoin administrators.

{% hint style="info" %}
**Prerequisites**

* [Custom Roles](permission/custom-roles/) must be enabled in the parent tenant.
* The parent tenant must be registered as a partner tenant in the RealmJoin backend. Otherwise the custom roles editor rejects `CanAdministerTenantPartners` as not allowed. This registration is done by RealmJoin support.
{% endhint %}

**Example: 1st Level Support across all customer tenants**

Your help desk staff are members of the Entra group `RJ-Support` in the parent tenant. This group is configured as a **Supporter** group in the parent tenant's RealmJoin role settings. To let them switch into the customer tenants, add the following rule to the custom roles of the parent tenant:

```json
{
  "Rules": [
    {
      "Name": "Support: Tenant Switcher",
      "Description": "Allows the support team to switch into all daughter tenants with their Supporter permissions.",
      "Groups": [
        "5d3c1a2b-8e4f-4a6b-9c7d-2e1f0a9b8c7d"
      ],
      "Permissions": [
        "CanAdministerTenantPartners"
      ]
    }
  ]
}
```

Replace the group ID with the object ID of your `RJ-Support` group. After the users sign in again, they see the tenant switcher in the header bar. In every daughter tenant they work with Supporter permissions, just like in the parent tenant.

Things to consider:

* **Only pre-defined roles carry over.** Other custom role permissions of the parent tenant do not apply in the daughter tenants. To grant additional permissions inside a daughter tenant, define a custom role in that daughter tenant.
* **A pre-defined role is still needed.** A user who holds only `CanAdministerTenantPartners` and has no pre-defined role in the parent tenant can switch tenants, but has no administrative permissions in the daughter tenants.
* **The permission also grants partner administrator rights.** For example, holders can manage templates (edit, delete, change packages and tokens). Assign it only to people who are allowed to do that.
* **Changes apply at the next sign-in.** Users who are already signed in must reload the portal or sign in again after the custom role has been saved.

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
