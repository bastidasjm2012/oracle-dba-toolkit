-- =====================================================
-- Script: top_sql_by_ash.sql
-- Purpose: Identify top SQL from ASH by activity
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

SET LINESIZE 200
COL sql_id FOR A15

SELECT sql_id,
       COUNT(*) AS ash_samples,
       MIN(sample_time) AS first_seen,
       MAX(sample_time) AS last_seen
FROM v$active_session_history
WHERE sql_id IS NOT NULL
GROUP BY sql_id
ORDER BY ash_samples DESC
FETCH FIRST 20 ROWS ONLY;
