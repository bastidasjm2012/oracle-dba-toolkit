# RAC Toolkit (Oracle 19c)

## Overview

Practical scripts and runbooks for administering Oracle RAC environments in real-world scenarios.

## Key Areas

* Instance lifecycle management
* Service configuration and validation
* SCAN listener verification
* Node operations (add/remove)
* Failover testing

## Environment

* Oracle Database 19c RAC
* Oracle Grid Infrastructure
* Linux (Oracle Linux / RHEL)

## Scripts Included

* `manage_rac_instances.sh` → Start/stop/status DB and instances
* `rac_services_check.sh` → Services status and configuration
* `scan_listener_check.sh` → SCAN VIP and listener validation

## Runbooks

* `add_remove_node_runbook.md` → Node operations
* `service_failover_test.md` → Validate HA at service level

## Usage

```bash
./manage_rac_instances.sh <db_unique_name>
./rac_services_check.sh <db_unique_name>
./scan_listener_check.sh
```

## ACE Contribution

Demonstrates hands-on RAC administration aligned with Oracle ACE Program (operations, HA validation, troubleshooting).
