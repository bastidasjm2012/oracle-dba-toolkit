#!/usr/bin/env bash
# =====================================================
# Script: scan_listener_check.sh
# Purpose: Validate SCAN VIP and SCAN listeners
# Author: Jesus Bastidas
# Env: Oracle 19c RAC
# =====================================================

echo "== SCAN VIP STATUS =="
srvctl status scan

echo "== SCAN LISTENERS STATUS =="
srvctl status scan_listener

echo "== LISTENER STATUS (EJEMPLO) =="
# lsnrctl status LISTENER_SCAN1
