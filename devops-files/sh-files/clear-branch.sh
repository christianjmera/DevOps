#!/bin/bash
# Description:
# This script clean a the branch.
###################################################################
# Author: Fabio Gil Rivera
# email: fabio.gil@codesa.com.co
echo "================================================"
echo "              CLEAR WORKSPACE JOB               "
echo "================================================"
cd $1 && rm -rf  * && rm -rf .git/
cd $2 && rm -rf  *
echo "Clean Workspace Triggers and Pipeine.... "