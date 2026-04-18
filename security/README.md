# 🔐 Security Toolkit (Oracle 19c)

## Overview

This module provides practical scripts and runbooks for securing Oracle Database 19c environments using industry best practices.

## Scope

* Transparent Data Encryption (TDE)
* Wallet and keystore management
* Tablespace encryption (data at rest)
* Oracle Net encryption (data in transit)
* Security validation procedures

---

## 🔧 Components

### 🔐 TDE Configuration

* `enable_tde_wallet.sql` → Configures wallet and keystore
* `enable_tde_wallet.md` → Step-by-step runbook

### 💾 Data Encryption (At Rest)

* `encrypt_users_tablespace.sql` → Online encryption of USERS tablespace

### 🌐 Network Encryption (In Transit)

* `network_encryption_sqlnet.ora.sample` → Sample sqlnet.ora config
* `network_encryption_validation.sql` → Validate encryption status

### 🔍 Validation

* `tde_validation.sql` → Wallet and encryption checks

---

## 📘 Documentation

Detailed implementation guides with screenshots:

* `docs/enable_tde_oracle_19c.pdf`
* `docs/encrypt_data_files_oracle_19c.pdf`
* `docs/enable_network_encryption_oracle_19c.pdf`

---

## 🧠 Security Coverage

| Layer           | Implementation               |
| --------------- | ---------------------------- |
| Data at Rest    | TDE + Tablespace Encryption  |
| Data in Files   | USERS tablespace encryption  |
| Data in Transit | Oracle Net encryption        |
| Key Management  | Wallet + Auto-login keystore |

---

## ⚙️ Usage Example

```bash
sqlplus / as sysdba
@enable_tde_wallet.sql
```

---

## 📎 Evidence of Product Usage

This module demonstrates:

* Real Oracle 19c security configuration
* End-to-end TDE implementation
* Encryption in storage and network layers
* Hands-on execution in lab/OCI environments

---

## 👤 Author

Jesus Bastidas
Oracle DBA | OCI Certified | ACE Apprentice
