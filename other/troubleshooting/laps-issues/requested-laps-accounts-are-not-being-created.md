# Requested LAPS Accounts are not being created

If you are facing the issue that requested LAPS Supporter Accounts are not created and the RJ Portal Device Page seems stuck on the "Requested..." message, you need to make sure all previously on-demand LAPS accounts on the device are no longer used and logged off.

{% hint style="warning" %}
If a Support Admin is requested, the RJ Agent creates the local ADM account on the device with the configuration provided within the tenant. The account has a lifetime, after the lifetime, it will be deleted. As long as the account exists, and it can not be removed, and a new Support Account can not be created.
{% endhint %}

The problem is, that without elevated rights, you cannot see any other logged on sessions, so if you cannot find any open windows like cmd or PowerShell, a reboot will always fix the issue.

This specific case can easily be identified in the logs written by the RealmJoin service. Those logs can be found in `C:\WINDOWS\Logs\realmjoin*.log`&#x20;

{% code overflow="wrap" %}
```log
2024-02-20 12:56:55.1239|DEBUG|RealmJoin.Service.PrivilegedToolProc|   3|[BEGIN] Running command `ManageLocalAdmins` by PID 14904
2024-02-20 12:56:56.7954|INFO|RealmJoin.Service.Handlers.ManageLocalAdminsHandler|  11|Profile of user "ADM-2F842BB7" is loaded. Won't delete now.
```
{% endcode %}

In this case the previously created account `ADM-2F842BB7` is still loaded, meaning there are open sessions left. So there a still processes running under this account.

Some time later, the account is no longer in use, and RealmJoin has successfully deleted the account

{% code overflow="wrap" %}
```log
2024-02-21 07:53:50.7103|DEBUG|RealmJoin.Service.PrivilegedToolProc|  10|[BEGIN] Running command `ManageLocalAdmins` by PID 2256
2024-02-21 07:53:52.3307|INFO|RealmJoin.Core.LocalAdminManagement.LocalUserAccounts|  15|Deleting user account ADM-2F842BB7.
2024-02-21 07:53:57.0369|INFO|RealmJoin.Service.Handlers.ManageLocalAdminsHandler|  15|Deleted user "ADM-2F842BB7".
2024-02-21 07:53:57.0369|INFO|RealmJoin.Core.LocalAdminManagement.LocalUserAccounts|  15|Deleting profile of user account ADM-2F842BB7.
2024-02-21 07:53:57.8334|INFO|RealmJoin.Service.Handlers.ManageLocalAdminsHandler|  15|Deleted profile of user "ADM-2F842BB7".
```
{% endcode %}

Again, some time later a new LAPS supporter account has been created

{% code overflow="wrap" %}
```log
2024-02-21 15:48:27.8962|DEBUG|RealmJoin.Service.PrivilegedToolProc|  10|[BEGIN] Running command `ManageLocalAdmins` by PID 18984
2024-02-21 15:48:29.2206|INFO|RealmJoin.Core.LocalAdminManagement.LocalUserAccounts|  13|Creating local admin account for slot SupportAccount.
2024-02-21 15:48:29.2628|INFO|RealmJoin.Core.LocalAdminManagement.LocalUserAccounts|  13|Created local admin account for slot SupportAccount with name ADM-4C051871.

```
{% endcode %}

