-- =====================================================
-- Script: enable_tde_wallet_multitenant.sql
-- Purpose: Enable TDE in Oracle 19c Multitenant (CDB/PDB)
-- Author: Jesus Bastidas
-- Environment: Oracle Database 19c Multitenant
-- Notes:
--   - Run as SYSDBA
--   - Execute from CDB root
--   - Restart database manually when prompted
--   - This script assumes unified keystore mode
-- =====================================================

SET ECHO ON
SET FEEDBACK ON
SET LINESIZE 200
SET PAGESIZE 100
SET SERVEROUTPUT ON

PROMPT =====================================================
PROMPT STEP 1 - Verify current container and PDB status
PROMPT =====================================================

SHOW CON_NAME
SHOW PDBS

PROMPT
PROMPT If required, open all PDBs manually before continuing:
PROMPT ALTER PLUGGABLE DATABASE ALL OPEN INSTANCES=ALL;
PROMPT ALTER PLUGGABLE DATABASE ORCLPDB SAVE STATE;
PROMPT

PROMPT =====================================================
PROMPT STEP 2 - Validate current TDE parameters
PROMPT =====================================================

SHOW PARAMETER WALLET_ROOT
SHOW PARAMETER TDE_CONFIGURATION

PROMPT =====================================================
PROMPT STEP 3 - Configure wallet_root in SPFILE
PROMPT =====================================================

ALTER SYSTEM SET wallet_root='/u01/app/oracle/product/19c/dbhome_1/wallet' SCOPE=SPFILE;

PROMPT
PROMPT =====================================================
PROMPT DATABASE RESTART REQUIRED
PROMPT Please execute manually:
PROMPT shutdown immediate;
PROMPT startup;
PROMPT Then reconnect as SYSDBA and continue.
PROMPT =====================================================
PROMPT

PROMPT =====================================================
PROMPT STEP 4 - Configure TDE keystore type
PROMPT =====================================================

ALTER SYSTEM SET tde_configuration='KEYSTORE_CONFIGURATION=FILE' SCOPE=BOTH;

SHOW PARAMETER TDE_CONFIGURATION

PROMPT =====================================================
PROMPT STEP 5 - Create software keystore
PROMPT =====================================================

ADMINISTER KEY MANAGEMENT CREATE KEYSTORE IDENTIFIED BY "Ora_DB4U";

PROMPT =====================================================
PROMPT STEP 6 - Validate wallet initial status
PROMPT =====================================================

COLUMN CON_ID FORMAT 999
COLUMN STATUS FORMAT A20
COLUMN WALLET_TYPE FORMAT A20

SELECT con_id,
       wallet_type,
       status
FROM v$encryption_wallet
ORDER BY con_id;

PROMPT =====================================================
PROMPT STEP 7 - Open keystore for all containers
PROMPT =====================================================

ADMINISTER KEY MANAGEMENT SET KEYSTORE OPEN FORCE KEYSTORE IDENTIFIED BY "Ora_DB4U" CONTAINER=ALL;

PROMPT =====================================================
PROMPT STEP 8 - Validate wallet across containers
PROMPT =====================================================

COLUMN CON_ID        FORMAT 999        HEADING 'CID'
COLUMN NAME          FORMAT A15        HEADING 'PDB_NAME'
COLUMN WRL_TYPE      FORMAT A15        HEADING 'WRL_TYPE'
COLUMN WRL_PARAMETER FORMAT A60        HEADING 'WALLET_PATH'
COLUMN WALLET_TYPE   FORMAT A20        HEADING 'WALLET_TYPE'
COLUMN STATUS        FORMAT A20        HEADING 'STATUS'

SELECT a.con_id,
       NVL(b.name, 'CDB$ROOT') AS name,
       a.wrl_type,
       a.wrl_parameter,
       a.wallet_type,
       a.status
FROM v$encryption_wallet a
LEFT JOIN v$pdbs b
  ON a.con_id = b.con_id
ORDER BY a.con_id;

PROMPT =====================================================
PROMPT STEP 9 - Create master key at CDB level
PROMPT =====================================================

ADMINISTER KEY MANAGEMENT SET KEY IDENTIFIED BY "Ora_DB4U" WITH BACKUP;

PROMPT =====================================================
PROMPT STEP 10 - Create master key at PDB level
PROMPT =====================================================

ALTER SESSION SET CONTAINER=ORCLPDB;

ADMINISTER KEY MANAGEMENT SET KEY IDENTIFIED BY "Ora_DB4U" WITH BACKUP;

PROMPT =====================================================
PROMPT STEP 11 - Return to CDB root
PROMPT =====================================================

ALTER SESSION SET CONTAINER=CDB$ROOT;

PROMPT =====================================================
PROMPT STEP 12 - Validate key distribution
PROMPT =====================================================

COLUMN CON_ID    FORMAT 999
COLUMN NAME      FORMAT A15
COLUMN OPEN_MODE FORMAT A12
COLUMN KEY_ID    FORMAT A40

SELECT p.con_id,
       p.name,
       p.open_mode,
       ek.key_id
FROM v$pdbs p
LEFT JOIN v$encryption_keys ek
  ON p.con_id = ek.con_id
ORDER BY p.con_id;

PROMPT =====================================================
PROMPT STEP 13 - Create auto-login keystore
PROMPT =====================================================

ADMINISTER KEY MANAGEMENT CREATE AUTO_LOGIN KEYSTORE FROM KEYSTORE IDENTIFIED BY "Ora_DB4U";

PROMPT =====================================================
PROMPT STEP 14 - Validate final wallet mode
PROMPT =====================================================

COLUMN CON_ID      FORMAT 999
COLUMN WALLET_TYPE FORMAT A20
COLUMN STATUS      FORMAT A20

SELECT con_id,
       wallet_type,
       status
FROM v$encryption_wallet
ORDER BY con_id;

PROMPT =====================================================
PROMPT STEP 15 - Optional tablespace encryption at PDB level
PROMPT =====================================================
PROMPT To encrypt USERS tablespace in ORCLPDB, execute manually:
PROMPT ALTER SESSION SET CONTAINER=ORCLPDB;
PROMPT ALTER TABLESPACE USERS ENCRYPTION ONLINE ENCRYPT;
PROMPT

PROMPT =====================================================
PROMPT STEP 16 - Optional advanced validation
PROMPT =====================================================

COLUMN KEYSTORE_MODE FORMAT A20
SELECT KEYSTORE_MODE
FROM V$ENCRYPTION_WALLET;

COLUMN MASTERKEYID FORMAT A40
SELECT MASTERKEYID
FROM v$database_key_info;

PROMPT =====================================================
PROMPT END OF SCRIPT
PROMPT Review output carefully and validate wallet files at OS level:
PROMPT ls -l /u01/app/oracle/product/19c/dbhome_1/wallet/tde
PROMPT =====================================================
