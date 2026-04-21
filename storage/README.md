# Storage Toolkit (Oracle 19c)

## Overview

Collection of scripts and runbooks for managing storage in Oracle Database 19c environments, aligned with real-world DBA operations and Oracle best practices.

---

##  Environment

* Oracle Database 19c
* ASM (Automatic Storage Management)
* Enterprise environments (RAC / Data Guard / OCI)

---

##  Storage Operations

###  Monitoring & Analysis

* [`tablespace_usage.sql`](tablespace_usage.sql)
* [`segment_growth_analysis.sql`](segment_growth_analysis.sql)
* [`asm_diskgroup_usage.sql`](asm_diskgroup_usage.sql)

---

###  Maintenance & Optimization

* [`reclaim_space.sql`](reclaim_space.sql)
* [`datafile_resize_candidates.sql`](datafile_resize_candidates.sql)
* [`asm_rebalance_monitor.sql`](asm_rebalance_monitor.sql)

---

##  Real-World Runbooks

###  ACFS Online Expansion (Zero Downtime)

Production scenario demonstrating online filesystem expansion over ASM without service interruption.

* Online resize using `acfsutil`
* Incremental growth strategy to reduce risk
* Full validation at OS and ASM levels

➡️ [Go to Runbook](acfs-expansion/)

---

##  Key Capabilities

* Tablespace monitoring and growth analysis
* Storage optimization and space reclamation
* ASM diskgroup analysis and rebalance tracking
* Datafile sizing recommendations
* Corruption detection techniques
* Zero-downtime storage operations using ACFS

---

##  ACE Contribution

This module demonstrates hands-on Oracle storage management aligned with real production scenarios.

It includes:

* Operational SQL scripts used in enterprise environments
* Reusable DBA toolkit components
* Real-world runbooks with validated execution
* Zero-downtime storage procedures using ASM and ACFS

---

##  Author

Jesus Bastidas
Oracle DBA | OCI Certified | ACE Apprentice

