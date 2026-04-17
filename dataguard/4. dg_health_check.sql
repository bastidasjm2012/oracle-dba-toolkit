-- =====================================================
-- Script: dg_health_check.sql
-- Purpose: General Data Guard Health Check
-- Author: Jesus Bastidas
-- Version: Oracle 19c
-- =====================================================

-- Role and Mode
SELECT DATABASE_ROLE, OPEN_MODE FROM V$DATABASE;

-- Archive Dest Status
SELECT DEST_ID, STATUS, ERROR
FROM V$ARCHIVE_DEST
WHERE STATUS <> 'INACTIVE';

-- Managed Recovery
SELECT PROCESS, STATUS, THREAD#, SEQUENCE#
FROM V$MANAGED_STANDBY;

-- Lag
SELECT NAME, VALUE FROM V$DATAGUARD_STATS;
