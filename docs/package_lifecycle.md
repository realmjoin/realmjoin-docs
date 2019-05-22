
# Package Lifecycle

This section describes the lifecycle of an application package including the updating process.  
Requesting as well as the mechanisms of adding and assigning packages will not be discussed in this section, as those steps are widely explained in chapter http://docs.realmjoin.com/managing-realmjoin.html#realmjoin-portal

## Requesting and initial installation

After subscribing/adding a new package, it is recommended to flag this package as **PreRelease**. This version is then assigned to a test user or test user group (recommended as non-mandatory).  
This test users then install the application via RealmJoin in various scenarios.  
If the installation and execution of the application work as planned, it is then assigned to the Application Owner (AO) and undergoing the user acceptance test (UAT).  
If approved, the PreRelease flag is removed as well as the test group assignment and the application can then be assigned to the users group. This workflow is shown in the pictures below.

[![RJ packaging workflow](./media/rj-package-workflow.png)](./media/rj-package-workflow.png)  

## Updating an existing application

The new package version will be added as a PreRelease package to the RealmJoin portal. Depending on the handling of the test users, the next step may vary.

* If the test users are regular accounts that already have the application assigned and installed on the clients, the PreRelease version is to be assigned to those.
* If the test users are dedicated test users, it might be necessary to assign the already rolled out version of the application beforehand and install on the clients to allow correct updating.  
The test users then install the application on the clients. Because of the PreRelease flag, RealmJoin will recognize the pending update.  
After the testing, the original application package will be updated and the test users are removed from the PreRelease flagged version. It is possible to leave the PreRelease flagged version in the back-end for further updating and testing.
If is recommended to test the update manually as well as automated (mandatory or auto upgrade package).

[![RJ packaging workflow detail](./media/rj-package-workflow-detail.png)](./media/rj-package-workflow-detail.png)

<!-- Der folgende Abschnitt ist identisch mit den oberen Inhalten und wurde mit Ergänzungen versehen. Sind diese Ergänzungen richtig?

# Package Lifecycle

This section describes an install process of a new package and a package update process for existing process.

## Install a new package

After adding a new package it is recommended to flag this package as **PreRelease**. This package will then assigned to a group of test users. Install the new package to these users via RealmJoin.

If the installation and execution of the package work as planned, it will be assigned to the **Application Owner**. A **User Acceptance Test** is part of this whole process as well. If all is approved, remove the PreRelease flag and the test group assignment. Assign the new package to the users group.

The following list is a short overview about the necessary steps:

1. Add a new package with **PreRelease** flag
2. PreRelease package assignment to test users
3. Pre Release package installation to test users
4. Testing phase
5. Assignment to **Application owner**
6. Remove PreRelease flag and test group assignment
7. Assignment to all users

The following graph is shown the RealmJoin packaging workflow:

[![RJ packaging workflow](./media/rj-package-workflow.png)](./media/rj-package-workflow.png)

## Package Update Process

The new package version will be flagged as a **PreRelease** in the RealmJoin portal. This package will then assigned to a group of test users (like the assignment for a new package). Depending on the handling of the test users, the following steps may vary:

* If the test users are regular accounts that already have a previous package version assigned and installed on the clients, the PreRelease version is to be assigned to those.
* If the test users are dedicated test users, it might be necessary to assign the already rolled out version of the package on the clients. Because of the PreRelease flag, RealmJoin will recognize the pending update. After testing, the original package will be updated and the test users will remove from the PreRelease flagged version. It is possible to leave the PreRelease flagged version in the backend for further updating and testing. If is recommended to test the update manually as well as automated (mandatory or auto upgrade package).

The following list is a short overview about the necessary steps:

1. Package with **PreRelease** flag
2. PreRelease package assignment to test users
3. Testing phase
4. Delete/Reassign PreRelease Package
5. Enable AutoUpgrade for the package
6. Complete Package upgrade/roll-out

In addition to the list the following graph is an illustration of the necessary steps:

[![RJ packaging workflow detail](./media/rj-package-workflow-detail.png)](./media/rj-package-workflow-detail.png)

-->
