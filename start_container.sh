#!/bin/bash

docker build . -t prov-analysis

docker run \
  --rm \
  -e JUPYTER_ENABLE_LAB=yes \
  -p 8888:8888 \
  --name prov-analysis \
  --mount type=bind,source="$(pwd)",target=/home/jovyan/work \
  --shm-size=38gb \
  prov-analysis