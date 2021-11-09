#!/bin/bash
# Description:
# This script deletes a tag from remote a repository.
###################################################################
# Author: Fabio Gil Rivera
# email: fabio.gil@codesa.com.co
echo "================================================"
echo "                   DELETE TAG                   "
echo "================================================"
TAG_TXT=$(cat $8)
echo "tag: $TAG_TXT"
BRANCH_TYPE=$(cat $2)
CHANGE_NUMBER=$(cat $3)

git -C $1 checkout $BRANCH_TYPE/$CHANGE_NUMBER
git -C $1 push http://$4:$5@10.184.58.9:7990/scm/$6/$7.git --delete $TAG_TXT