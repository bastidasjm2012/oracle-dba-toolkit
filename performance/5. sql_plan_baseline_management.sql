-- =====================================================
-- Script: sql_plan_baseline_management.sql
-- Purpose: Enable / Disable SQL Plan Baselines
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

-- Check baselines
SELECT sql_handle, plan_name, enabled, accepted
FROM dba_sql_plan_baselines;

-- Enable baseline
VAR v_num NUMBER;
EXEC :v_num := DBMS_SPM.ALTER_SQL_PLAN_BASELINE(
  sql_handle      => '&sql_handle',
  plan_name       => '&plan_name',
  attribute_name  => 'enabled',
  attribute_value => 'YES'
);
PRINT v_num;

-- Disable baseline
EXEC :v_num := DBMS_SPM.ALTER_SQL_PLAN_BASELINE(
  sql_handle      => '&sql_handle',
  plan_name       => '&plan_name',
  attribute_name  => 'enabled',
  attribute_value => 'NO'
);
PRINT v_num;

-- Fix / unfix
EXEC :v_num := DBMS_SPM.ALTER_SQL_PLAN_BASELINE(
  sql_handle      => '&sql_handle',
  plan_name       => '&plan_name',
  attribute_name  => 'fixed',
  attribute_value => 'YES'
);
PRINT v_num;
