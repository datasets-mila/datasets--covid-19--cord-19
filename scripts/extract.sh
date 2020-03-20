#!/bin/bash

# this script is meant to be used with 'datalad run'

pip install -r scripts/requirements_extract.txt
ERR=$?
if [ $ERR -ne 0 ]; then
   echo "Failed to install requirements: pip install: $ERR"
   exit $ERR
fi

mkdir -p extract/

jug status -- scripts/extract.py "./*.zip*" --output "extract/"
jug execute -- scripts/extract.py "./*.zip*" --output "extract/" 1> extract.out 2> extract.err

rm files_count.stats
for dir in extract/*
do
	echo $(find $dir -type f | wc -l; echo $dir) >> files_count.stats
done

du -s extract/* > disk_usage.stats
