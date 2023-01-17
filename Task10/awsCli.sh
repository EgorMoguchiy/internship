#!/bin/bash
source .env
if [ "$OSTYPE" == "linux-gnu" ]
then
    # Linux
    type=$(awk '/^NAME/' /etc/*-release)
    if [ $type == 'NAME="Ubuntu"' ]
    then
        echo 'Linux Ubuntu'
        sudo apt install awscli
        aws configure set profile.default.region $REGION
        aws configure set profile.default.aws_access_key_id $ACCESS_PUBLIC
        aws configure set profile.default.aws_secret_access_key $ACCESS_SECRET
    elif [ -f /etc/redhat-release ]
    then
        echo 'Linux Redhat'
        sudo dnf install awscli
        aws configure set profile.default.region $REGION
        aws configure set profile.default.aws_access_key_id $ACCESS_PUBLIC
        aws configure set profile.default.aws_secret_access_key $ACCESS_SECRET
    fi
elif [ "$OSTYPE" == "darwin" ]
then
    # Mac OSX
    echo 'Mac OSX'
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /
    aws configure set profile.default.region $REGION
    aws configure set profile.default.aws_access_key_id $ACCESS_PUBLIC
    aws configure set profile.default.aws_secret_access_key $ACCESS_SECRET
elif [ "$OSTYPE" == "msys" ]
then
    # Windows
    echo 'Windows'
    powerShell "msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi"
fi