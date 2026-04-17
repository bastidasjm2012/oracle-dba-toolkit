-- =====================================================
-- Script: tablespace_usage.sql
-- Purpose: Monitor tablespace usage
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

SET LINESIZE 200
COL tablespace_name FORMAT A25

SELECT df.tablespace_name,
       ROUND(SUM(df.bytes)/1024/1024) total_mb,
       ROUND(SUM(df.bytes - fs.bytes)/1024/1024) used_mb,
       ROUND(SUM(fs.bytes)/1024/1024) free_mb,
       ROUND((SUM(df.bytes - fs.bytes)/SUM(df.bytes))*100,2) pct_used
FROM dba_data_files df
JOIN (SELECT tablespace_name, SUM(bytes) bytes
      FROM dba_free_space
      GROUP BY tablespace_name) fs
ON df.tablespace_name = fs.tablespace_name
GROUP BY df.tablespace_name
ORDER BY pct_used DESC;
