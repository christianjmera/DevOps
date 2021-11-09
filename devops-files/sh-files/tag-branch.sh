#!/bin/bash
# Description:
# This script tags a branch.
###################################################################
# Author: Fabio Gil Rivera
# email: fabio.gil@codesa.com.co
echo "================================================"
echo "             GIT TAG - BRANCH TYPE              "
echo "================================================"
changeNumber=$(cat $2)
branchType=$(cat $3)
echo "TYPE_BRANCH: $branchType"
printf "\n"

echo "THE CHANGE_NUMBER: $changeNumber"
printf "\n"

branch_name=$branchType/$changeNumber
echo "THE BRANCH_NAME: $branch_name"
printf "\n"

echo "================================================"
echo "             GIT CHECKOUT - BRANCH              "
echo "================================================"
git -C $1 checkout $branch_name
printf "\n"

echo "================================================"
echo "            GENERATE CONSECUTIVE TAG            "
echo "================================================"
git -C $1 tag -l -n --sort=-creatordate | grep -Eo "$changeNumber-[0-9]{1,20}" > $4
stringTag=$(cat $4 | awk 'NR==1 {print; exit}')

prefix="$changeNumber-"
timesNumberChange=${stringTag#"$prefix"}

if [ "$timesNumberChange" == "" ]; then
    tag="$changeNumber-1"
else
    incrementTagCount=$((timesNumberChange+1))
    echo "incrementTagCount: $incrementTagCount" 
    tag="$changeNumber-$incrementTagCount"
fi

printf "\n"
echo "Consecutive tag: $tag"
echo "$tag" > $9
printf "\n"

echo "================================================"
echo "        GENERATE TAGGING - ($branch_name)        "
echo "================================================"
git -C $1 tag $tag -m "$changeNumber"
git -C $1 push http://$5:$6@10.184.58.9:7990/scm/$7/$8.git $tag $branchType/"$changeNumber" #--tags