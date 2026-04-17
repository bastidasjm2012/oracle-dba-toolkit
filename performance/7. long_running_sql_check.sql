-- =====================================================
-- Script: long_running_sql_check.sql
-- Purpose: Identify long-running SQL from V$SESSION and LONGOPS
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

SET LINESIZE 200
COL username FOR A20
COL sql_id FOR A15
COL opname FOR A35

-- Active sessions with SQL
SELECT s.sid,
       s.serial#,
       s.username,
       s.status,
       s.sql_id,
       s.event,
       s.seconds_in_wait
FROM v$session s
WHERE s.username IS NOT NULL
  AND s.sql_id IS NOT NULL
ORDER BY s.seconds_in_wait DESC;

-- Long operations
SELECT opname,
       sid,
       serial#,
       sofar,
       totalwork,
       ROUND(sofar/NULLIF(totalwork,0)*100,2) AS pct_complete
FROM v$session_longops
WHERE totalwork > 0
  AND sofar <> totalwork
ORDER BY sid;
