# AnyDesk Integration

AnyDesk allows access to devices including the option to elevate rights by using the RealmJoin [LAPS](../local-admin-password-solution-laps) feature. AnyDesk can be installed on Windows and macOS.

ID numbers are used by AnyDesk to establish connections between two computers. Share your ID number with another user (this user needs AnyDesk as well). This user has to enter the ID number in the AnyDesk menu. When you accept the request, the other user will have access to your desktop.

RealmJoin Client for Windows allows to skip the ID number sharing because every ID number in an organization is linked to single user. An administrator just needs to know the user and can request access to the desktop. However, the user has to be able to accept this request.

## Deployment Workflow

1. The customer sends a request to [glueckkanja-gab (GKGAB)](mailto:support@glueckkanja-gab.com), for a quote on AnyDesk.
2. GKGAB orders a license from AnyDesk.
3. AnyDesk sends a license and login credentials to GKGAB
4. GKGAB deploys AnyDesk
5. GKGAB sends the 'public download' URL to the customer
6. The customer configures the AnyDesk Group Settings in [RealmJoin Classic Portal](https://realmjoin-web.azurewebsites.net)
7. GKGAB does the backend integration in RealmJoin
8. AnyDesk is deployed
