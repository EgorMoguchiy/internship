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
        sudo mkdir ~/.aws
        sudo aws configure set profile.default.region $REGION
        sudo aws configure set profile.default.aws_access_key_id $ACCESS_PUBLIC
        sudo aws configure set profile.default.aws_secret_access_key $ACCESS_SECRET
    elif [ -f /etc/redhat-release ]
    then
        echo 'Linux Redhat'
        sudo dnf install awscli
        sudo mkdir ~/.aws
        sudo aws configure set profile.default.region $REGION
        sudo aws configure set profile.default.aws_access_key_id $ACCESS_PUBLIC
        sudo aws configure set profile.default.aws_secret_access_key $ACCESS_SECRET
    fi
elif [ "$OSTYPE" == "darwin" ]
then
    # Mac OSX
    echo 'Mac OSX'
    curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /
    sudo mkdir ~/.aws
    sudo aws configure set profile.default.region $REGION
    sudo aws configure set profile.default.aws_access_key_id $ACCESS_PUBLIC
    sudo aws configure set profile.default.aws_secret_access_key $ACCESS_SECRET
elif [ "$OSTYPE" == "msys" ]
then
    # Windows
    echo 'Windows'
    powerShell "msiexec.exe /i https://awscli.amazonaws.com/AWSCLIV2.msi"
fi