---
description: Use of Administrative Units with RealmJoin
---

# Limiting the Scope of RealmJoin Portal

RealmJoin Portal supports [Microsoft Entra ID Administrative Units (AU)](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/administrative-units).

### Restricted Management Administrative Unit

To hide/protect some sensitive groups from RealmJoin, you can create a **restricted management Administrative Unit in Microsoft Entra ID**. After creating that restricted AU, you can assign **sensitive groups** to that AU and "hide" these groups from RealmJoin Portal (and everybody using the RealmJoin Portal).\
This is a good idea for **high-sensitive groups** that you want to protect, e.g. groups used for granting permissions/roles or to exclude users from certain Conditional Access Policies etc. \
Users and applications **must explicitly be granted/added** to the scope of the AU to be able to interact with groups that are "protected" by the restricted management AU.

To make use of restricted management administrative units, there are **no settings needed in RealmJoin**.

* You can read more about Restricted management administrative units in Microsoft Entra ID [here](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/admin-units-restricted-management).
* To create a restricted AU, you can follow Microsoft's guide [here](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/admin-units-manage?tabs=admin-center).
* To add groups you want to protect to the restricted AU as well as administrators that you want to allow to interact with these groups, please see this guide [here](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/admin-units-members-add?tabs=admin-center).

### Assigning a dedicated Administrative Unit to RealmJoin Portal

To fully "encapsulate" RealmJoin Portal, you can create a dedicated AU (default non-restricted) and assign the RealmJoin Portal app to that AU.\
As a result, RealmJoin Portal will create groups only in that specific AU - and is also only able to interact with groups that are specifically in scope of this AU.

* To create an AU, you can follow [Microsoft's guide](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/admin-units-manage?tabs=admin-center)
* To add groups to the AU scope so that RealmJoin is still able to interact with these groups, please see [this guide](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/admin-units-members-add?tabs=admin-center)
* To assign roles with administrative unit scope, please see [this guide](https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/manage-roles-portal?tabs=admin-center#assign-roles-with-administrative-unit-scope)

#### Enable RealmJoin to use Administrative Units

1. Create AU in Entra (default, not restricted).
2. In the AU, permanently assign the role "Group Administrator" to the RealmJoin Portal app (Application ID: "b0130885-16be-4c6f-83de-5b1042b5d2e3").
3. Add the Microsoft Graph API permission `"AdministrativeUnit.Read.All"` (type "Application") to the RealmJoin Portal app (Application ID: "b0130885-16be-4c6f-83de-5b1042b5d2e3").
4. Especially if you already use the RealmJoin Portal, move all groups that RealmJoin should be able to interact with to the scope of the AU (e.g. existing app groups or permission groups).
5. Create a ticket with the [RealmJoin Support](https://www.realmjoin.com/help/) and provide the ObjectID of the AU you created.
6. Wait for verification from RealmJoin Support.
7. Now you can safely remove the following application permissions from the RealmJoin Portal app (Application ID: "b0130885-16be-4c6f-83de-5b1042b5d2e3") as these are not AU-aware:\
   \
   `"Group.ReadWrite.All"` & `"GroupMember.ReadWrite.All"` \
   \
   Instead the Entra Role "Group Administrator" is used. Make sure that you added the role beforehand (Step 2).

{% hint style="info" %}
Please keep in mind that you can only add/remove the Microsoft Graph API permissions via Graph!

You can use the Grant-Script from the [RealmJoin Portal features page](https://portal.realmjoin.com/organization/features) shown below to add the `"AdministrativeUnit.Read.All"` permission.

* Copy the script, add the permission in the marked $permissions section, execute the script, confirm execution in the Portal.&#x20;
* RealmJoin will automatically check for the new permission and will display it in the granted section.
* For removal of `"Group.ReadWrite.All"` & `"GroupMember.ReadWrite.All"` you can use the "Revoke" option next to the permissions to generate a script only for that specific permission.&#x20;
{% endhint %}

<figure><img src="../../.gitbook/assets/Untitled picture (1).png" alt=""><figcaption></figcaption></figure>

