# PowerShell modules

## Required Modules

The shared runbooks available on [GitHub](https://github.com/realmjoin/realmjoin-runbooks) expect/use the following Windows PowerShell 5.1 modules:

* RealmJoin.RunbookHelper
* Az.Accounts
* Az.Storage
* AzureAD
* ExchangeOnlineManagement

RealmJoin Portal will automatically import and install these modules if referenced from inside a runbook. This import will also honor specified minimum versions for modules.
