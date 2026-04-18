-- =====================================================
-- Script: create_dblink.sql
-- Purpose: Create database link
-- Author: Jesus Bastidas
-- Environment: Oracle 19c
-- =====================================================

CREATE DATABASE LINK remote_db
CONNECT TO user IDENTIFIED BY password
USING 'tns_alias';
