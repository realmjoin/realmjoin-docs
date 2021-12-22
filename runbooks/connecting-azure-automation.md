# Connecting Azure Automation

## Overview

To enable RealmJoin Portal to offer runbooks as a way to automate daily operations, you need to connect an [Azure Automation Account](https://azure.microsoft.com/en-us/services/automation/). This Automation Account will host your runbooks as well as the [permissions](azure-ad-roles-and-permissions.md) needed for the runbooks to function in your environment.

This guide will help you to onboard either a new or existing Automation Account.

Please be aware, the RunAs-Account (Automation Account's identity) will potentially have far reaching [permissions ](azure-ad-roles-and-permissions.md)in your environment, like the ability to modify group- or user-objects in AzureAD or mailboxes in Exchange Online. Please carefully limit the number of people with access to this Automation Account to prevent unwanted usage of these permissions.

When reusing an existing Automation Account, be aware that RealmJoin Portal automates the creation, updating and removal of runbooks coming from the [shared online repository of runbooks](https://github.com/realmjoin/realmjoin-runbooks). This might not be adequate for an existing Automation Account.



