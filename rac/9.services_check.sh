#!/bin/bash
# =====================================================
# Script: manage_rac_instances.sh
# Purpose: services_check
# Author: Jesus Bastidas
# Env: Oracle 19c RAC
# =====================================================
srvctl status service -db $1
