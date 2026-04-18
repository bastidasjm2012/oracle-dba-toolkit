-- =====================================================
-- Script: application_containers.sql
-- Purpose: Create and manage Application Containers and Application PDBs
-- Author: Jesus Bastidas
-- Environment: Oracle 19c Multitenant
-- =====================================================

-- Create Application Container
CREATE PLUGGABLE DATABASE appcont
  AS APPLICATION CONTAINER
  ADMIN USER pdb_appadm IDENTIFIED BY manager
  FILE_NAME_CONVERT=('C:\\ORACLE\\ORADATA\\XE\\','C:\\ORACLE\\ORADATA\\APPCONT\\');

ALTER PLUGGABLE DATABASE appcont OPEN;

-- Switch to Application Container
ALTER SESSION SET CONTAINER = appcont;

-- Create Application PDB
CREATE PLUGGABLE DATABASE appspdb
  ADMIN USER pdb_appadm IDENTIFIED BY manager
  FILE_NAME_CONVERT=('C:\\ORACLE\\ORADATA\\XE\\','C:\\ORACLE\\ORADATA\\APPSPDB\\');

ALTER PLUGGABLE DATABASE appspdb OPEN;

-- Sync all applications
ALTER SESSION SET CONTAINER=APPSPDB;
ALTER PLUGGABLE DATABASE APPLICATION ALL SYNC;

-- Drop Application PDB (example)
ALTER SESSION SET CONTAINER = appcont;
ALTER PLUGGABLE DATABASE appspdb CLOSE;
DROP PLUGGABLE DATABASE appspdb INCLUDING DATAFILES;
