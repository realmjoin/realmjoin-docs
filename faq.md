# FAQ

## Which links should I bookmark?

*   RealmJoin Portal:

    [https://portal.realmjoin.com](https://portal.realmjoin.com)
*   Public Runbook Repostirory:

    [https://github.com/realmjoin/realmjoin-runbooks](https://github.com/realmjoin/realmjoin-runbooks)
*   General RealmJoin website:

    [https://realmjoin.com/](https://realmjoin.com)
*   Documentation:

    [https://docs.realmjoin.com/](https://docs.realmjoin.com)

## Am I able to maintain my own software packages and updates?

RealmJoin contains an internal application store compatible with Intunewin (Microsoft Endpoint Manager / Intune Package Format), with over 1000 existing applications. glueckkanja-gab offers packaging-as-a-service to provide any missing applications.

As RealmJoin directly leverages Microsoft Endpoint Manager, it is possible to offer additional applications which are maintained independently by your organization next to applications sourced through our application store.

## Am I able to maintain my own runbooks?

glueckkanja-gab AG offers a public repository of runbooks at [https://github.com/realmjoin/realmjoin-runbooks](https://github.com/realmjoin/realmjoin-runbooks). These runbooks are are improved and updated continously and build the foundation of what we think are everyday routine taks in a modern workplace environment. As such, these runbooks are automatically synced into a RealmJoin environment as part of our service.

RealmJoin leverages standard Azure Automation features to host these shared runbooks. They will be stored using a `rjgit-` prefix in your Azure Automation Account. You can simply add custom runbooks without this prefix to the same Azure Automation account. As long as the runbooks adheres to our naming scheme, RealmJoin Portal will present your custom runbooks in the same way as our shared ones.

TODO: Describe Runbook naming scheme

## Is RealmJoin providing an uninstall of software?

A general uninstall feature is currently not implemented. In a 100% modern workplace environment with evergreen applications, regular removabilty of installed software does not exist anymore.\\

Because of the volatile history of unattended and the sometimes unpredictable issues with incomplete uninstalls we have decided against this practice.

There are typically three reasons to uninstall software:

* The license should be re-used for a different user. In this case, it's easy to just create a package to enable/disable a license for a user.
* The software needs to be removed because of \[choose your reason]. In this situation, a dedicated remove-software-package can be created.
* There is a newer version of the software. This is not a reason to use an uninstall command but instead, it is a common practice for every software package used by RealmJoin to 'clean' any precursory binaries or settings.

All items above describe special usecases and should be solved in cooperation with glueckkanja-gab AG consulting services.
