-- =====================================================
-- Script: tde_status.sql
-- Purpose: Check TDE configuration
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

SELECT * FROM v$encryption_wallet;

SELECT tablespace_name, encrypted
FROM dba_tablespaces
WHERE encrypted = 'YES';
