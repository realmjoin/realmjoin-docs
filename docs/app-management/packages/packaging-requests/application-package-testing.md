# Application Package Testing

### Overview

Most application packaging requests undergo a four-stage testing cycle to validate installation mechanics, exit codes, and deployment behavior. Functional testing of application features is the responsibility of the customer application owner.

### Testing Stages

#### 1. Manual Installation on Sandbox System

* Application binaries are manually installed following vendor documentation
* Dependencies and environmental requirements are identified and documented
* Reinstallation over existing installation is tested
* Uninstallation as provided by the vendor binaries is verified

#### 2. Command Line Installation

* Provided silent installation parameters and flags are tested and verified
* Exit codes are validated for success and failure scenarios
* Installation scripts are developed and executed
* Automated reinstallation and uninstallation procedures are validated
* All processes are confirmed to execute without user interaction

#### 3. Package Preparation

* Installation files are organized into RealmJoin package formats (NuGet, intunewin)
* Package metadata and scripts are defined, documentation added (if applicable)

#### 4. Automated Installation

* The package is installed on a fresh sandbox system
* Installation behaviour is verified against previous manual and CLI tests
* Package-based reinstallation and uninstallation are tested
* Exit codes are validated across all scenarios
* **Malware scanning** is performed on generic-packages during the automated build as a mandatory security gate

