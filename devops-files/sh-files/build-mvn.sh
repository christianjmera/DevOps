#!/bin/bash
# Description:
# This script is building project 
################################################################
# Author: Fabio Gil Rivera
# email: fabio.gil@codesa.com.co
################################################################
echo "================================================"
echo "              BUILD - MVN ON JAVA               "
echo "================================================"
printf "\n"
git -C $1 checkout develop
cd $1 && mvn install -U -DskipTests