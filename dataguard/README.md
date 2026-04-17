Data Guard scripts
# Data Guard Toolkit (Oracle 19c)

## Overview

This module provides practical scripts and runbooks for managing Oracle Data Guard environments in real-world scenarios.

The content is based on hands-on experience with Oracle 19c environments, including hybrid setups (on-premise + OCI) and high availability configurations.

## Key Features

* Data Guard health checks
* Apply lag monitoring
* Snapshot standby conversion
* Switchover and failover procedures
* Troubleshooting scripts

## Environment

* Oracle Database 19c
* Data Guard (Physical Standby)
* Hybrid environments (on-premise + OCI)

## Scripts Included

* `dg_health_check.sql` → General DG validation
* `dg_lag_check.sql` → Apply lag monitoring
* `convert_snapshot_standby.sql` → Snapshot conversion
* `switchover_runbook.md` → Controlled role transition
* `failover_runbook.md` → Disaster recovery scenario

## Usage

Run scripts using SQL*Plus:

```bash
sqlplus / as sysdba
@dg_health_check.sql
```

## ACE Contribution

This repository demonstrates real-world Oracle Data Guard operations, aligned with Oracle ACE Program requirements, focusing on practical usage, troubleshooting, and high availability scenarios.
