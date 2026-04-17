-- =====================================================
-- Script: dg_lag_check.sql
-- Purpose: Monitor Data Guard Apply Lag
-- Author: Jesus Bastidas
-- Version: Oracle 19c
-- =====================================================

SET LINESIZE 200
COL NAME FORMAT A30
COL VALUE FORMAT A20

SELECT NAME, VALUE, TIME_COMPUTED
FROM V$DATAGUARD_STATS
WHERE NAME IN ('apply lag','transport lag');
