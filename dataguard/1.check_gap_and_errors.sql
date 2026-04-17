-- =====================================================
-- Script: check_gap_and_errors.sql
-- Purpose: Check Data Guard errors
-- Author: Jesus Bastidas
-- Version: Oracle 19c
-- =====================================================
SELECT MESSAGE FROM V$DATAGUARD_STATUS;
