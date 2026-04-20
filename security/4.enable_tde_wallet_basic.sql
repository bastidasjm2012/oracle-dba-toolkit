-- =====================================================
-- Script: enable_tde_wallet_basic.sql
-- Purpose: Enable TDE in Oracle 19c NON-CDB
-- Author: Jesus Bastidas
-- Environment: Oracle Database 19c NON-CDB
-- Notes:
--   - Run as SYSDBA
--   - Restart database manually when prompted
--   - This script is intended for NON-CDB environments
-- =====================================================

SET ECHO ON
SET FEEDBACK ON
SET LINESIZE 200
SET PAGESIZE 100
SET SERVEROUTPUT ON

PROMPT =====================================================
PROMPT STEP 1 - Validate current TDE parameters
PROMPT =====================================================

SHOW PARAMETER WALLET_ROOT
SHOW PARAMETER TDE_CONFIGURATION

PROMPT =====================================================
PROMPT STEP 2 - Configure wallet_root in SPFILE
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
PROMPT STEP 3 - Configure TDE keystore type
PROMPT =====================================================

ALTER SYSTEM SET tde_configuration='KEYSTORE_CONFIGURATION=FILE' SCOPE=BOTH;

SHOW PARAMETER TDE_CONFIGURATION

PROMPT =====================================================
PROMPT STEP 4 - Create software keystore
PROMPT =====================================================

ADMINISTER KEY MANAGEMENT CREATE KEYSTORE IDENTIFIED BY "Ora_DB4U";

PROMPT =====================================================
PROMPT STEP 5 - Validate wallet initial status
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
PROMPT STEP 6 - Open keystore
PROMPT =====================================================

ADMINISTER KEY MANAGEMENT SET KEYSTORE OPEN IDENTIFIED BY "Ora_DB4U";

PROMPT =====================================================
PROMPT STEP 7 - Validate wallet after opening keystore
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
PROMPT STEP 8 - Create master key with backup
PROMPT =====================================================

ADMINISTER KEY MANAGEMENT SET KEY IDENTIFIED BY "Ora_DB4U"
WITH BACKUP USING 'backup';

PROMPT =====================================================
PROMPT STEP 9 - Validate wallet after key creation
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
PROMPT STEP 10 - Create auto-login keystore
PROMPT =====================================================

ADMINISTER KEY MANAGEMENT CREATE AUTO_LOGIN KEYSTORE
FROM KEYSTORE IDENTIFIED BY "Ora_DB4U";

PROMPT =====================================================
PROMPT STEP 11 - Close password-based keystore
PROMPT =====================================================

ADMINISTER KEY MANAGEMENT SET KEYSTORE CLOSE IDENTIFIED BY "Ora_DB4U";

PROMPT =====================================================
PROMPT STEP 12 - Validate final wallet mode
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
PROMPT END OF SCRIPT
PROMPT Review output carefully and validate wallet files at OS level:
PROMPT ls -l /u01/app/oracle/product/19c/dbhome_1/wallet/tde
PROMPT =====================================================











