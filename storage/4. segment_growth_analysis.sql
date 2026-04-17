-- =====================================================
-- Script: segment_growth_analysis.sql
-- Purpose: Analyze segment growth over time (AWR)
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

SELECT owner,
       object_name,
       object_type,
       SUM(space_used_delta)/1024/1024 AS growth_mb
FROM dba_hist_seg_stat
GROUP BY owner, object_name, object_type
ORDER BY growth_mb DESC
FETCH FIRST 20 ROWS ONLY;
