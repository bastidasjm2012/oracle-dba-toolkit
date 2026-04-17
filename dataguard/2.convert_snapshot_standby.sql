-- =====================================================
-- Script: convert_snapshot_standby.sql
-- Purpose: Convert Physical Standby to Snapshot Standby and revert back
-- Author: Jesus Bastidas
-- Version: Oracle 19c
-- =====================================================

-- STEP 1: Configure FRA (Primary)
ALTER SYSTEM SET db_recovery_file_dest_size=<size>;
ALTER SYSTEM SET db_recovery_file_dest=<path>;

-- STEP 2: Stop Managed Recovery (Standby)
ALTER DATABASE RECOVER MANAGED STANDBY DATABASE CANCEL;

SHUTDOWN IMMEDIATE;
STARTUP MOUNT;

-- STEP 3: Convert to Snapshot Standby
ALTER DATABASE CONVERT TO SNAPSHOT STANDBY;

STARTUP;

-- Validate
SELECT open_mode, database_role FROM v$database;

-- ================================
-- REVERT BACK TO PHYSICAL STANDBY
-- ================================

SHUTDOWN IMMEDIATE;
STARTUP MOUNT;

ALTER DATABASE CONVERT TO PHYSICAL STANDBY;

SHUTDOWN IMMEDIATE;
STARTUP MOUNT;

ALTER DATABASE RECOVER MANAGED STANDBY DATABASE DISCONNECT FROM SESSION;
