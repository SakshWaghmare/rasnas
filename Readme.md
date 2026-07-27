# Prerequisites

Before deploying the project, ensure the following software is installed on your system.

| Software | Version | Purpose |
|----------|---------|---------|
| VirtualBox | Latest Stable | Virtual Machine Provider |
| Vagrant | Latest Stable | Infrastructure Provisioning |

---

## Verify Installation

Open Command Prompt or PowerShell and verify the installations:

```bash
vagrant --version
VBoxManage --version
```

You should see output similar to:

```text
Vagrant 2.x.x
7.x.x
```

---

## Clone the Repository

```bash
git clone https://github.com/SakshWaghmare/rasnas.git
cd rasnas
```

---

## Deploy the Environment

Start the complete lab using:

```bash
vagrant up
```

To verify the Vagrant configuration before deployment:

```bash
vagrant validate
```

After the VMs are created, check their status:

```bash
vagrant status
```

Expected output:

```text
automation    running
target        running
```