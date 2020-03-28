#!/bin/bash

echo "scp all to root@182.92.169.70"

if [ $1 == "main" ]
then
  scp -r ./api/main root@182.92.169.70:/root/workspace/gospace/src/dist
elif [ $1 == "front" ]
then
  scp -r ./front/dist/* root@182.92.169.70:/root/workspace/gospace/src/dist/front
else
  scp -r ./api/main root@182.92.169.70:/root/workspace/gospace/src/dist
  scp ./front/dist/* root@182.92.169.70:/root/workspace/gospace/src/dist/front
fi
