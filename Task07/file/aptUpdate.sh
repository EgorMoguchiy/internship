#!/bin/bash
HOST="10.1.1.125"
ssh -i /home/ubuntu/Keys.pem ubuntu@$HOST 'sudo apt-get update'