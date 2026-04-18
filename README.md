# 🚀 Oracle DBA Toolkit (19c) – Real-World Scripts & Runbooks

## 📌 Overview

This repository contains a comprehensive collection of **Oracle Database 19c DBA scripts and runbooks**, built from real-world operational scenarios.

It demonstrates hands-on experience across key Oracle technologies, including:

* Data Guard (High Availability)
* RAC (Cluster Management)
* SQL Performance (AWR / ASH / Tuning)
* Storage & ASM
* Security (TDE / DBMS_CRYPTO)
* Integration (DB Links)
* Multitenant Architecture (CDB / PDB)

---

## 🧠 About this Project

This toolkit was developed as part of **practical DBA activities in enterprise environments**, including hybrid setups (on-premise + OCI).

The goal is to provide:

* reusable scripts
* troubleshooting procedures
* operational runbooks
* real-world use cases

All content reflects **hands-on Oracle product usage**, not theoretical examples.

---

## 📂 Repository Structure

| Module      | Description                                                |
| ----------- | ---------------------------------------------------------- |
| dataguard   | Data Guard monitoring, lag analysis, failover & switchover |
| rac         | RAC services, instances, SCAN, and failover validation     |
| performance | SQL tuning, AWR/ASH analysis, profiles and baselines       |
| storage     | ASM, tablespaces, reclaim space, growth analysis           |
| security    | Encryption, TDE, wallet validation                         |
| integration | Database links and connectivity                            |
| multitenant | CDB/PDB management, application containers, triggers       |
| docs        | Technical documentation (Hybrid Data Guard lab)            |
| images      | Screenshots and evidence of product usage                  |

---

## 🔍 Real-World Usage

The scripts and procedures in this repository have been used in:

* Oracle Database 19c Enterprise environments
* Hybrid architectures (on-premise + Oracle Cloud Infrastructure)
* Data Guard configurations (Primary / Standby)
* RAC clusters
* ASM-based storage environments

---

## 📎 Evidence of Product Usage

This repository is part of an **Oracle ACE Apprentice submission** and includes:

* ✔ Real DBA scripts used in production-like environments
* ✔ Hybrid Active Data Guard implementation (OCI + on-prem simulation)
* ✔ Operational runbooks (failover, switchover, troubleshooting)
* ✔ Screenshots of Oracle Cloud and database configurations
* ✔ SQL-based validation and monitoring queries

All activities were performed **after ACE Apprentice acceptance** and demonstrate real Oracle product usage.

---

## ⚙️ Example

### Check Data Guard synchronization

```sql
SELECT STATUS, GAP_STATUS
FROM V$ARCHIVE_DEST_STATUS
WHERE DEST_ID = 2;
```

---

## 💼 Key Value

This repository focuses on:

* Practical DBA operations
* High availability scenarios
* Performance troubleshooting
* Real-world Oracle environments

It is intended for DBAs, engineers, and learners seeking **applied Oracle knowledge**.

---

## 🏷️ Tags

Oracle | DBA | DataGuard | RAC | ASM | Performance | Multitenant | OCI

---

## 👤 Author

**Jesus Bastidas**
Oracle DBA | OCI Certified | ACE Apprentice

---

## 📜 License

MIT License

