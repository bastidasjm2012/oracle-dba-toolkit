-- =====================================================
-- Script: wallet_check.sql
-- Purpose: Validate wallet status
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

SELECT WRL_TYPE, STATUS, WALLET_TYPE
FROM v$encryption_wallet;
