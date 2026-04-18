-- =====================================================
-- Script: datafile_resize_candidates.sql
-- Purpose: Identify datafiles that can be resized
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

SELECT file_id,
       file_name,
       bytes/1024/1024 AS size_mb,
       autoextensible
FROM dba_data_files
ORDER BY size_mb DESC;
