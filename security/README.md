# 🔐 Security Toolkit (Oracle 19c)

## 📌 Overview

This module provides practical scripts and runbooks for implementing **Oracle Database 19c security best practices**, with a strong focus on **Transparent Data Encryption (TDE)** and secure database configurations.

It covers both:

* **Non-CDB (standard environments)**
* **Multitenant (CDB/PDB enterprise environments)**

---

## 🧠 TDE Runbooks (Progressive Approach)

This repository includes two complementary runbooks designed to demonstrate **progressive mastery of Oracle TDE**.

---

### 🔹 1. Basic TDE Configuration (NON-CDB)

**File:** `enable_tde_wallet_basic.md`
**Script:** `enable_tde_wallet_basic.sql`

This runbook covers:

* Wallet configuration (`wallet_root`)
* Keystore creation
* Master key generation
* Auto-login keystore setup
* Basic validation (`v$encryption_wallet`)

📌 Use case:

* Non-CDB databases
* Single-instance environments
* Initial TDE implementation
* Foundational learning

📎 Notes:

* This scenario **does not use the CONTAINER clause**
* Designed for simplicity and clarity

---

### 🔹 2. Advanced TDE in Multitenant (CDB/PDB)

**File:** `enable_tde_wallet_multitenant.md`
**Script:** `enable_tde_wallet_multitenant.sql`

This runbook extends TDE configuration to enterprise environments:

* Multitenant architecture awareness (CDB / PDB)
* Wallet operations using `CONTAINER=ALL`
* Validation across containers (`CON_ID`)
* Key lifecycle management
* Tablespace encryption (online)
* Encryption at PDB level
* Optional decryption (rollback)
* Advanced validation using:

  * `v$pdbs`
  * `v$encryption_wallet`
  * `v$encryption_keys`

📌 Use case:

* Oracle Multitenant environments
* Enterprise deployments
* Production-ready security configurations

📎 Notes:

* Requires connection to **CDB root**
* Uses **unified keystore mode**

---

## 🔧 Additional Components

### 🔐 TDE Core Validation Scripts

* `tde_validation.sql` → Basic wallet status check
* `tde_multitenant_wallet_validation.sql` → CDB/PDB wallet validation

---

### 💾 Data Encryption (Data at Rest)

* `encrypt_users_tablespace.sql` → Online tablespace encryption

---

### 🌐 Network Encryption (Data in Transit)

* `network_encryption_sqlnet.ora.sample` → sqlnet.ora configuration
* `network_encryption_validation.sql` → Validate encryption status

---

## 📘 Documentation (Evidence)

The following documents provide **step-by-step implementations with screenshots**:

* `docs/enable_tde_oracle_19c_primary.pdf`
* `docs/encrypt_data_file_oracle_19c_primary.pdf`
* `docs/enable_network_encryption_oracle_19c_primary.pdf`

---

## 🔐 Security Coverage

| Layer                | Implementation                   |
| -------------------- | -------------------------------- |
| Data at Rest         | TDE + Tablespace Encryption      |
| Data in Files        | USERS tablespace encryption      |
| Data in Transit      | Oracle Net encryption            |
| Key Management       | Wallet + Auto-login keystore     |
| Multitenant Security | CDB/PDB validation and lifecycle |

---

## ⚙️ Usage Examples

### Basic (NON-CDB)

```bash
sqlplus / as sysdba
@enable_tde_wallet_basic.sql
```

---

### Multitenant (CDB)

```bash
sqlplus / as sysdba
@enable_tde_wallet_multitenant.sql
```

---

## 📎 Evidence of Product Usage

This module demonstrates:

* Real Oracle Database 19c security implementation
* Hands-on TDE configuration and validation
* Multitenant (CDB/PDB) encryption scenarios
* Integration with OCI-based lab environments
* End-to-end encryption lifecycle

All activities were executed **after ACE Apprentice acceptance**.

---

## 🧠 Key Value

This module is designed to:

* Provide practical DBA security procedures
* Demonstrate real-world Oracle encryption scenarios
* Support enterprise security architectures
* Enable reusable scripts and operational runbooks

---

## 👤 Author

**Jesus Bastidas**
Oracle DBA | OCI Certified | ACE Apprentice

---

## 📜 License

MIT License
