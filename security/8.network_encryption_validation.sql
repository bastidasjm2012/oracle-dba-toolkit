-- =====================================================
-- Script: network_encryption_validation.sql
-- Purpose: Validate Oracle Net encryption and checksumming
-- Author: Jesus Bastidas
-- Environment: Oracle Database 19c
-- =====================================================

SET LINESIZE 120
COL network_service_banner FOR A85

SELECT i.network_service_banner
FROM v$session_connect_info i,
     v$session s
WHERE s.sid = i.sid
  AND s.serial# = i.serial#
  AND s.username = 'SYS';
