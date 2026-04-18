-- =====================================================
-- Script: enable_tde_wallet.sql
-- Purpose: Configure TDE wallet and keystore in Oracle 19c
-- Author: Jesus Bastidas
-- Environment: Oracle Database 19c
-- Notes:
--   Run this script as SYSDBA from SQL*Plus.
--   Database restart steps must be executed manually.
-- =====================================================

PROMPT Step 1 - Configure wallet_root in SPFILE
ALTER SYSTEM SET wallet_root='/u01/app/oracle/product/19c/dbhome_1/wallet' SCOPE=SPFILE;

PROMPT Step 2 - Restart database manually before continuing
PROMPT shutdown immediate
PROMPT startup

PROMPT Step 3 - Configure keystore type
ALTER SYSTEM SET tde_configuration='KEYSTORE_CONFIGURATION=FILE' SCOPE=BOTH;

PROMPT Step 4 - Create password-based keystore
ADMINISTER KEY MANAGEMENT CREATE KEYSTORE IDENTIFIED BY "Ora_DB4U";
    
PROMPT Step 5 - Open keystore
ADMINISTER KEY MANAGEMENT SET KEYSTORE OPEN FORCE KEYSTORE IDENTIFIED BY "Ora_DB4U" CONTAINER=ALL;

PROMPT Step 6 - Validate wallet status before master key
SELECT con_id, wallet_type, status
FROM v$encryption_wallet;

PROMPT Step 7 - Create master key with backup
ADMINISTER KEY MANAGEMENT SET KEY IDENTIFIED BY "Ora_DB4U"
WITH BACKUP USING 'backup'
CONTAINER=ALL;

PROMPT Step 8 - Validate wallet status after master key
SELECT con_id, wallet_type, status
FROM v$encryption_wallet;

PROMPT Step 9 - Create auto-login keystore
ADMINISTER KEY MANAGEMENT CREATE AUTO_LOGIN KEYSTORE
FROM KEYSTORE IDENTIFIED BY "Ora_DB4U";

PROMPT Step 10 - Close password-based keystore
ADMINISTER KEY MANAGEMENT SET KEYSTORE CLOSE IDENTIFIED BY "Ora_DB4U" CONTAINER=ALL;

PROMPT Step 11 - Validate wallet status after auto-login
SELECT con_id, wallet_type, status
FROM v$encryption_wallet;











