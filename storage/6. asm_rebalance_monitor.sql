-- =====================================================
-- Script: asm_rebalance_monitor.sql
-- Purpose: Monitor ASM rebalance operations
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

SELECT inst_id,
       group_number,
       operation,
       state,
       power,
       est_rate,
       est_minutes
FROM gv$asm_operation;
