# Local Admin Password Management

## Overview

Local Administrator Password Solution (LAPS) will solve the issue of using identical administrative credentials on every Windows computer for support and emergency purposes. On its own, LAPS creates a randomly generated password for a local admin account.

With RealmJoin it is possible to manage secure and individualized administrative accounts, either for local support or remote support on a large scale. RealmJoin saves encrypted passwords in Azure Key Vault within the customer's tenant and stores audit logs of every access to these credentials.

RealmJoin's API allows you to request a "Support Account" (local admin) for a given device in your tenant. See [RealmJoin's Swagger description](https://customer-api.realmjoin.com/swagger/index.html) to see which operations are currently supported in detail. Using LAPS with RealmJoin requires the deployment of the RealmJoin Windows Client.

It is assumed you have correctly set up LAPS in your environment and deployed the RealmJoin Windows Client on your devices. Also, make sure to [authenticate ](realmjoin-api/authentication.md)every request against RealmJoin's API using an appropriate http Authorization header.

## Requesting a Support Account

Tell RealmJoin to create a local Support Account on the target device using the endpoint `/laps/request`. The request is queued using Application insights and will be processed RealmJoin Backend and RealmJoin Windows Client as soon as possible. When the account is created/usable.

The endpoint will return an estimate how long the account create will take. When the account is ready, see [here](local-admin-password-management.md#retrieve-support-account-credentials) on how to query for the credentials.

### Example

Let us assume the following situation:

* You have your RealmJoin API credentials and encoded them to `dC0xMjM0MTIzNDpteVMzY3JldCE=` (Base64)
* The target device's Entra `deviceId` is `9999dab9-f946-40ee-9a17-2500c8d00878`. Be aware this is not the Entra object id (different attribute)!

Currently no Support Account exists on the target device.

![Local Accounts - before requesting a Support Account](../../.gitbook/assets/Laps-before.png)

Let us build the **request**:

Headers:

```http
Authorization: Basic dC0xMjM0MTIzNDpteVMzY3JldCE=
Content-Type: application/json
```

Request / URI:

```http
POST https://customer-api.realmjoin.com/laps/request?deviceID=9999dab9-f946-40ee-9a17-2500c8d00878
```

This endpoint does not expect a request body.

**Response**

Http Status: `200` (OK)

Body (in JSON-Notation):

```json
{
    "estimatedWaitTime": "00:12:31.8215813"
}
```

The response contains the approximate time until the RealmJoin Windows Client will create the local Support Account. In this example expect to wait at least 12 minutes. If the client has not been seen for a long time, you might get `null` as estimate instead of a number.

The RealmJoin Windows Client will poll for jobs every 30 min by default. The approximation offered by the API is based on the last time the Windows Client checked in.

## Retrieve Support Account Credentials

The endpoint `/laps/retrieve` is used to query if a Support Account has already been created as well as to collect the actual credentials of the Support Account.

Let us query the same `deviceId` of `9999dab9-f946-40ee-9a17-2500c8d00878` as in the example [above](local-admin-password-management.md#requesting-a-support-account).

In our example a Support Account (Full Name: "Local Support Admin Account") has been created on the target device by the RealmJoin Windows Client:

![Local Accounts - Support Account is successfully created](../../.gitbook/assets/Laps-after.png)

**Request**

Headers:

```http
Authorization: Basic dC0xMjM0MTIzNDpteVMzY3JldCE=
Content-Type: application/json
```

Request / URI:

```http
POST https://customer-api.realmjoin.com/laps/retrieve?deviceID=9999dab9-f946-40ee-9a17-2500c8d00878
```

This endpoint does not expect a request body.

**Response**

If the credentials are not available yet, the endpoint will return Http Status: `404` (Not Found) and some technical details in the body:

Body (JSON)

```json
{
    "type": "https://tools.ietf.org/html/rfc7231#section-6.5.4",
    "title": "Not Found",
    "status": 404,
    "traceId": "00-4c56c3cb0f9b394abf934b107b148613-1234b2497e261649-00"
}
```

You can keep querying until the credentials are ready.&#x20;

If the credentials are ready, the endpoint will return Http Status: `200` (OK) and the credentials:

Body (JSON)

```json
{
    "password": "Upji1234",
    "username": "ADM-5A2F2169",
    "accountExpirationDate": "2021-12-21T02:14:07+00:00"
}
```

You can use these credentials to offer support to a user, e.g. by connecting via the AnyDesk Supporter Client.&#x20;

As you can see, by default a Support Account has a limited lifetime and will have to be recreated if access is needed after the expiration date. This is to make sure, that no high privilege credentials persist from day to day operations task.
