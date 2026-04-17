
-- =====================================================
-- Script: convert_snapshot_standby.sql
-- Purpose: Validate Data Guard NO GAP
-- Author: Jesus Bastidas
-- Version: Oracle 19c
-- =====================================================
SELECT STATUS, GAP_STATUS FROM V$ARCHIVE_DEST_STATUS WHERE DEST_ID=2;
