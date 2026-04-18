-- =====================================================
-- Script: drop_pdb.sql
-- Purpose: Close and drop a Pluggable Database
-- Author: Jesus Bastidas
-- Environment: Oracle 19c Multitenant
-- =====================================================

-- Check PDBs
SHOW PDBS;

SELECT con_id, name, open_mode
FROM v$containers;

-- Close PDB
ALTER PLUGGABLE DATABASE pdb4 CLOSE;

-- Drop with datafiles
DROP PLUGGABLE DATABASE pdb4 INCLUDING DATAFILES;

-- Drop keeping datafiles
-- DROP PLUGGABLE DATABASE pdb4 KEEP DATAFILES;
