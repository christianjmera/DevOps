#!/bin/bash
# Description:
# This script gets branch types between feature and hotfix branches. 
# Its output is: feature or hotfix.
################################################################
# Author: Fabio Gil Rivera
# email: fabio.gil@codesa.com.co
################################################################
echo "================================================"
echo "      GIT LOG - IDENTIFY BRANCH TYPE            "
echo "================================================"
changeNumber=$(cat $2)  
branchName="feature/$changeNumber"
printf "\n"

if [ `git -C $1 branch -r | grep $branchName` ]; 
then
    branchType="feature"
else
    branchType="hotfix"
fi

printf "\n"
echo "Branch Type: $branchType"
echo "$branchType" > $3
printf "\n"