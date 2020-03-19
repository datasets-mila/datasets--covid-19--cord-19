#!/bin/bash

# This script is meant to be used with the command 'datalad run'

# Note: kaggle requires an API token as described in its doc: https://www.kaggle.com/docs/api

pip install -r scripts/requirements_download.txt
ERR=$?
if [ $ERR -ne 0 ]; then
   echo "Failed to install requirements: pip install: $ERR"
   exit $ERR
fi

kaggle datasets download -d allen-institute-for-ai/CORD-19-research-challenge

md5sum CORD-19-research-challenge.zip > md5sums
