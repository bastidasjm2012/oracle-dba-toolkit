-- =====================================================
-- Script: test_dblink.sql
-- Purpose: Validate DB link connectivity
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

SELECT * FROM dual@remote_db;
