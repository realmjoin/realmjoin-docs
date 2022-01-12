# Authentication

## Overview

The RealmJoin backend expects application credentials (username and secret) presented via [http basic authentication](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication).

Username and secret will be created for you from our glueckkanja-gab operations team. Please feel free to reach out if you want to integrate RealmJoin into your own tools and processes!

## Example

For the sake of demonstration, let us assume the username created for you is `t-12341234`and the secret is `myS3cret!`.&#x20;

To authenticate, concatenate username and password, separated by a colon (`t-12341234:myS3cret!)`and encode this into a Base64-String.&#x20;

Our example username and secret will encode to `dC0xMjM0MTIzNDpteVMzY3JldCE=` &#x20;

Now, on every request against the RealmJoins backend service present an http header with the resulting Authorization:

```
Authorization: Basic dC0xMjM0MTIzNDpteVMzY3JldCE=
```

RealmJoin will then allow you to interact with ressources in your envorinment. It will not allow yuo to interact with resources foreign to your tenant.
