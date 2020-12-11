#!/usr/bin/env bash

source /foundryssl/variables.sh

# foundry_user=foundry
# foundry_home=/foundrydata


# check if user home exists
if [ -d "${foundry_home}" ]
then
    # path exists
    echo "${foundry_home} path exists" 
else
    # check if foundry user exists
    # create user if it does not exist
    if grep "${foundry_user}" /etc/passwd
    then
        echo "${foundry_user} user already exists"
    else
        sudo useradd -m -d "${foundry_home}" "${foundry_user}"
        echo "${foundry_user} user created"
    fi
fi

# permissions
sudo chmod 770 ${foundry_home}
sudo chgrp foundry /foundry
sudo chmod 770 /foundry
sudo usermod -a -G foundry ec2-user