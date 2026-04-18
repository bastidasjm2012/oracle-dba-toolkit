-- =====================================================
-- Script: container_pdb_triggers.sql
-- Purpose: Create database event triggers in CDB and PDB
-- Author: Jesus Bastidas
-- Environment: Oracle 19c Multitenant
-- =====================================================

-- Trigger in CDB
CREATE OR REPLACE TRIGGER cdbtrigger
AFTER STARTUP ON DATABASE
BEGIN
  NULL;
END;
/

-- Trigger in PDB
CREATE OR REPLACE TRIGGER pdbtrigger_name
AFTER STARTUP ON PLUGGABLE DATABASE
BEGIN
  NULL;
END;
/
