-- =====================================================
-- Script: sql_profile_management.sql
-- Purpose: Check, disable and drop SQL Profiles
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

-- Check SQL Profile used by a specific SQL_ID
SELECT sql_id, sql_profile, plan_hash_value
FROM v$sql
WHERE sql_id = '&sql_id';

-- Check all SQL Profiles
SELECT name, status, sql_text
FROM dba_sql_profiles;

-- Disable a SQL Profile
EXEC DBMS_SQLTUNE.ALTER_SQL_PROFILE(
  name => '&profile_name',
  attribute_name => 'STATUS',
  value => 'DISABLED'
);

-- Enable a SQL Profile
EXEC DBMS_SQLTUNE.ALTER_SQL_PROFILE(
  name => '&profile_name',
  attribute_name => 'STATUS',
  value => 'ENABLED'
);

-- Drop a SQL Profile
EXEC DBMS_SQLTUNE.DROP_SQL_PROFILE(
  name => '&profile_name'
);
