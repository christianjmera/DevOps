#!/bin/bash
# Description:
# This script is tag and push imagen to registry 
################################################################
# Author: Fabio Gil Rivera
# email: fabio.gil@codesa.com.co
################################################################
echo "================================================"
echo "          DOCKER BUILD - MVN ON JAVA            "
echo "================================================"
printf "\n"

cd $1 && docker login harbordt.codesa.com.co --username=$3 --password=$4
cd $1 && docker tag $2:$5 harbordt.codesa.com.co/evolucion/$2:$5
cd $1 && docker push harbordt.codesa.com.co/evolucion/$2:$5