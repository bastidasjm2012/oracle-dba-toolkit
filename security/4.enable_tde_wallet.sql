-- =====================================================
-- Script: enable_tde_wallet.sql
-- Purpose: Configure wallet_root and TDE keystore type
-- Author: Jesus Bastidas
-- Environment: Oracle Database 19c
-- =====================================================

ALTER SYSTEM SET wallet_root='/u01/app/oracle/product/19c/dbhome_1/wallet' SCOPE=SPFILE;
ALTER SYSTEM SET tde_configuration='KEYSTORE_CONFIGURATION=FILE' SCOPE=BOTH;
