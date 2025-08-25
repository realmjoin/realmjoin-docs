# Custom Protocol

The `CustomProtocol` class defines a set of URI-like prefixes that can be used to trigger specific actions within the system by providing a package ID. These custom protocol handlers are designed to streamline operations such as syncing, installing, upgrading, or initiating remote support for software packages.

| Constant                   | Description                                       | Example Usage                  |
| -------------------------- | ------------------------------------------------- | ------------------------------ |
| `realmjoin:`               | Base prefix for all custom protocol actions.      |                                |
| `realmjoin:sync:`          | Triggers a sync operation for the RealmJoin agent | `realmjoin:sync:`              |
| `realmjoin:install:`       | Initiates installation of the specified package.  | `realmjoin:install:package-id` |
| `realmjoin:upgrade:`       | Starts an upgrade process for the package.        | `realmjoin:upgrade:package-id` |
| `realmjoin:remotesupport:` | Launches a remote support session.                | `realmjoin:remotesupport:`     |
