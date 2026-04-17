-- =====================================================
-- Script: reclaim_space.sql
-- Purpose: Identify reclaimable space in segments
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================
SELECT owner,
       segment_name,
       segment_type,
       tablespace_name,
       bytes/1024/1024 AS size_mb
FROM dba_segments
ORDER BY size_mb DESC;
