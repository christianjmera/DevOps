#!/bin/bash
# Description:
# This script identify the last commit. 
# Its output is: develop
################################################################
# Author: Fabio Gil Rivera
# email: fabio.gil@codesa.com.co
################################################################
echo "================================================"
echo "      GIT LOG - IDENTIFY THE CHANGE             "
echo "================================================"
git -C $1 checkout develop
printf "\n"
git -C $1 log -n 1 develop | grep "commit" | grep -v "*" > $3
lastReleaseCommitId=$(cat $3 | awk '{print $2}')

git -C $1 log --format=%B -n 2 $lastReleaseCommitId | grep -Eo 'Sprint[0-9]{1,20}|sprint[0-9]{1,20}' | awk 'NR==1 {print; exit}' > $2
branch_number=$(cat $2)
echo "The change number is: $branch_number"
printf "\n"