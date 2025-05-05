# Roles and Permissions

## Architecture

You can delegate access to different levels of functionality of RealmJoin Portal to **Entra users** via **pre-defined and/or custom roles:**

* **pre-defined roles** with a **fixed set of permissions**
  * **recommended** and **ready-to-use**
  * multiple roles can be combined although this increases complexity (not recommended)
  * assignable to Entra groups
  * see [available roles](pre-defined-roles.md)
* **custom roles** with **flexible** selection of **permissions**
  * if pre-defined roles do not meet your requirements, you can **request** [**Custom Roles**](custom-roles/) to be enabled for your environment
  * custom roles can be combined with pre-defined roles (to add additional permissions) although this increases complexity (not recommended)
  * assignable to Entra groups and/or single users

To delegate/limit which subset of runbooks can be used by different operators, please see [Runbook Permissions](../../automation/runbooks/runbook-permissions.md).

### Permission Defaults

By default, all users will have access to the [User profile](../../ugd-management/about-me.md) page to facilitate self-service scenarios.

During initial onboarding, the Entra role "Global Administrators" is also assigned as a RealmJoin Administrator to facilitate the initial configuration process.
