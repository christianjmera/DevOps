#!/bin/bash
# Description:
# This script change difference.
###################################################################
# Author: Fabio Gil Rivera
# email: fabio.gil@codesa.com.co
echo "================================================"
echo "         GIT LOG - LISTING OF CHANGES           "
echo "================================================"
branchType=$(cat $3)
changeNumber=$(cat $2)

#Buscar el ultimo Tag 
LatestTag=$(git -C $1 tag --merged $branchType/$changeNumber --sort=-taggerdate | grep "$changeNumber" | awk 'NR==1 {print; exit}')
echo "LatestTag: $LatestTag"

#Buscar el penulultimo Tag
penultimateTag=$(git -C $1 tag --merged $branchType/$changeNumber --sort=-taggerdate | grep "$changeNumber" | awk 'NR==2 {print; exit}')
echo "penultimateTag: $penultimateTag"

#Buscar el VPD o VP Tag 
vpdInitTag=$(git -C $1 tag --merged $branchType/$changeNumber --sort=-taggerdate | grep -E "^VP|^v" | awk 'NR==1 {print; exit}')
echo "vpdInitTag: $vpdInitTag"
printf "\n"

echo "the difference will be between"
printf "\n"

#generar el diff segun la condicion del tag
if [ "$LatestTag" = "$changeNumber-1" ]; then
  git -C $1 diff $LatestTag $vpdInitTag --no-commit-id --name-only  > $4
  echo "diff $LatestTag and $vpdInitTag"
else
  git -C $1 diff $LatestTag $penultimateTag --no-commit-id --name-only  > $4
  echo "diff $LatestTag and $penultimateTag"
fi
printf "\n"

echo "The changes of this commit are:"
printf "\n"
cat $4 
printf "\n"
total=$(wc -l $4 | awk '{print $1}')
echo "Total: $total"
printf "\n"