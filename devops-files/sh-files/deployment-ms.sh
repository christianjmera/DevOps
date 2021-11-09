#!/bin/bash
# Description:
# This script is Deployment in Rancher 
################################################################
# Author: Fabio Gil Rivera
# email: fabio.gil@codesa.com.co
################################################################
echo "================================================"
echo "        DEPLOYMENT - RANCHER KS8 OF MS          "
echo "================================================"
printf "\n"
echo "Deploy Kubernetes in Rancher"
#kubectl delete deployment $DOCKER_IMAGE_NAME --ignore-not-found=true
kubectl apply -f $1/Deployment.yml -n architecture