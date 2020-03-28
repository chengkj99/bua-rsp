#!/bin/bash

echo "start build $1!"

if [ "$1" == "linux" ]
then
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build main.go

elif [ "$1" == "windows" ]
then
	CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build main.go
fi


