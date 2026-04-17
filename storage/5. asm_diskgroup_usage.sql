-- =====================================================
-- Script: asm_diskgroup_usage.sql
-- Purpose: Check ASM diskgroup usage
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

SET LINESIZE 200

SELECT name,
       total_mb,
       free_mb,
       ROUND((1 - free_mb/total_mb)*100,2) AS pct_used
FROM v$asm_diskgroup;
