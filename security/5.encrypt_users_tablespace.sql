-- =====================================================
-- Script: encrypt_users_tablespace.sql
-- Purpose: Encrypt USERS tablespace online in PDB
-- Author: Jesus Bastidas
-- Environment: Oracle Database 19c
-- =====================================================

ALTER SESSION SET CONTAINER = orclpdb;

-- Validate current encryption status
SELECT tablespace_name, encrypted
FROM dba_tablespaces;

-- Encrypt USERS tablespace online
ALTER TABLESPACE users ENCRYPTION ONLINE ENCRYPT;

-- Validate again
SELECT tablespace_name, encrypted
FROM dba_tablespaces;
