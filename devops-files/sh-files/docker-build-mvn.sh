#!/bin/bash
# Description:
# This script is building image of project 
################################################################
# Author: Fabio Gil Rivera
# email: fabio.gil@codesa.com.co
################################################################
echo "================================================"
echo "          DOCKER BUILD - MVN ON JAVA            "
echo "================================================"
printf "\n"
git -C $1 checkout develop
cd $1 && docker build -t $2:$3 .