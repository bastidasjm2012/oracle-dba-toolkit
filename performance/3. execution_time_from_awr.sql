-- =====================================================
-- Script:  execution_time_from_awr.sql
-- Purpose: Check execution time and plan hash value from AWR/ASH
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

SET LINESIZE 150
COL exec_start FOR A25
COL exec_end   FOR A25
COL difference FOR A28

SELECT instance_number,
       sql_exec_id,
       sql_plan_hash_value,
       exec_start,
       TO_CHAR(exec_end,'MM/DD/YYYY HH:MI:SS AM') exec_end,
       difference
FROM (
  SELECT instance_number,
         sql_exec_id,
         sql_plan_hash_value,
         TO_CHAR(sql_exec_start,'MM/DD/YYYY HH:MI:SS AM') AS exec_start,
         MAX(sample_time) exec_end,
         EXTRACT(HOUR   FROM (MAX(sample_time) - sql_exec_start) DAY TO SECOND) || ' HH ' ||
         EXTRACT(MINUTE FROM (MAX(sample_time) - sql_exec_start) DAY TO SECOND) || ' MI ' ||
         EXTRACT(SECOND FROM (MAX(sample_time) - sql_exec_start) DAY TO SECOND) || ' SS' difference
  FROM dba_hist_active_sess_history
  WHERE sql_id='&sql_id'
  GROUP BY instance_number, sql_exec_id, sql_plan_hash_value, sql_exec_start
  ORDER BY sql_exec_start
);
