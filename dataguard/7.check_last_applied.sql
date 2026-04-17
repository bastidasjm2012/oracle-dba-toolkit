-- =====================================================
-- Script: check_last_applied.sql
-- Purpose: -- Last applied and received logs
-- Author: Jesus Bastidas
-- Version: Oracle 19c
-- =====================================================
SELECT max(sequence#) FROM v$archived_log WHERE applied='YES';
