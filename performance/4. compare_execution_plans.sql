-- =====================================================
-- Script: compare_execution_plans.sql
-- Purpose: Compare two execution plans in Oracle 19c
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

VARIABLE v_rep CLOB

BEGIN
  :v_rep := DBMS_XPLAN.COMPARE_PLANS(
    reference_plan    => cursor_cache_object('&sql_id_ref', NULL),
    compare_plan_list => plan_object_list(cursor_cache_object('&sql_id_cmp', NULL)),
    type              => 'TEXT',
    level             => 'TYPICAL',
    section           => 'ALL'
  );
END;
/

SET LINE 999 PAGE 999
SET LONG 100000
COLUMN report FORMAT A200

SELECT :v_rep AS report
FROM dual;
