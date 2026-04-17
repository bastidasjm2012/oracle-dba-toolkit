#!/usr/bin/env bash
# =====================================================
# Script: rac_services_check.sh
# Purpose: Validate RAC services configuration and status
# Author: Jesus Bastidas
# Env: Oracle 19c RAC
# =====================================================

DB="$1"

if [ -z "$DB" ]; then
  echo "Usage: $0 <db_unique_name>"
  exit 1
fi

echo "== SERVICES STATUS =="
srvctl status service -db "$DB"

echo "== SERVICES CONFIG =="
srvctl config service -db "$DB"

echo "== CRS RESOURCES (SERVICES) =="
crsctl stat res -t | egrep -i "service|ora.*.svc"
