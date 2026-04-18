-- =====================================================
-- Script: create_tde_keystore.sql
-- Purpose: Create and open password-based TDE keystore
-- Author: Jesus Bastidas
-- Environment: Oracle Database 19c
-- =====================================================

ADMINISTER KEY MANAGEMENT CREATE KEYSTORE IDENTIFIED BY "Ora_DB4U";

ADMINISTER KEY MANAGEMENT SET KEYSTORE OPEN FORCE KEYSTORE IDENTIFIED BY "Ora_DB4U" CONTAINER=ALL;
