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

RealmJoin contains an internal application store compatible with Intunewin (Microsoft Endpoint Manager / Intune Package Format), with over 1000 existing applications. RealmJoin offers packaging-as-a-service to provide any missing applications.

As RealmJoin directly leverages Microsoft Endpoint Manager, it is possible to offer additional applications which are maintained independently by your organization next to applications sourced through our application store.

## Am I able to maintain my own runbooks?

RealmJoin offers a [public repository of runbooks](https://github.com/realmjoin/realmjoin-runbooks). These runbooks are improved and updated continuously and build the foundation of what we think are everyday routine tasks in a modern workplace environment. As such, these runbooks are automatically synced into a RealmJoin environment as part of our service.

RealmJoin leverages standard Azure Automation features to host these shared runbooks. They will be stored using a `rjgit-` prefix in your Azure Automation Account. You can simply add custom runbooks without this prefix to the same Azure Automation account. If the runbooks adhere to our naming scheme, RealmJoin Portal will present your custom runbooks in the same way as our shared ones.

See [Runbook naming scheme](../../automation/runbooks/naming-conventions.md)

