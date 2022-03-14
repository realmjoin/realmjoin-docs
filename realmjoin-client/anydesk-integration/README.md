# AnyDesk Integration

AnyDesk allows access to client devices including the option to elevate rights by using the RealmJoin LAPS feature. AnyDesk can be installed on Windows and macOS.

AnyDesk uses ID numbers to establish connections between two computers. Share your ID number with another user (this user needs AnyDesk as well). This user has to enter the ID number in the AnyDesk menu. When you accept the request, the other user will have access to your desktop.

RealmJoin Client allows to skip the ID number sharing because every AnyDesk ID number in an organization is linked to single user. An Administrator just needs to know the user and can request access to the desktop. However, the user has to be able to accept this request.

## AnyDesk Deployment Workflow

1. The customer sends a request to [glueckkanja-gab (GKGAB)](mailto:support@glueckkanja-gab.com), for a quote on AnyDesk.
2. GKGAB orders a license from AnyDesk.
3. AnyDesk sends a license and login credentials to GKGAB
4. GKGAB deploys AnyDesk
5. GKGAB sends the 'public download' URL to the customer
6. The customer configures the AnyDesk Group Settings in [RealmJoin Classic](https://realmjoin-web.azurewebsites.net)
7. GKGAB does the backend integration in RealmJoin
8. AnyDesk is deployed
