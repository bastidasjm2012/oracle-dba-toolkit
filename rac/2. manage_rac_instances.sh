#!/usr/bin/env bash
# =====================================================
# Script: manage_rac_instances.sh
# Purpose: Manage RAC database and instances
# Author: Jesus Bastidas
# Env: Oracle 19c RAC
# =====================================================

DB="$1"

if [ -z "$DB" ]; then
  echo "Usage: $0 <db_unique_name>"
  exit 1
fi

echo "== DATABASE STATUS =="
srvctl status database -d "$DB"

echo "== START DATABASE =="
# srvctl start database -d "$DB"

echo "== STOP DATABASE =="
# srvctl stop database -d "$DB"

echo "== INSTANCE STATUS =="
srvctl status instance -d "$DB"

echo "== EXAMPLE START INSTANCE =="
echo "srvctl start instance -d $DB -i <instance_name> -n <node_name>"

echo "== EXAMPLE STOP INSTANCE =="
echo "srvctl stop instance -d $DB -i <instance_name> -n <node_name>"
