#!/bin/bash

updateresults=/tmp/updateresults
needreboot=0

checkupdates > $updateresults

cntr=0
cntr=$(cat $updateresults | wc -l)

if [ "$(cat $updateresults | cut -d ' ' -f1 | grep -P '(^|\s)\Klinux(?=\s|$)')" == "linux" ];
then
    echo -e "\n\n**************************\n\n\
            REBOOT AS SOON AS POSSIBLE\n\n\
            **************************\n\n"
    needreboot=1
fi

if [ "$(cat $updateresults | cut -d ' ' -f1 | grep -P '(^|\s)\Klinux(?=\s|$)')" == "nvidia" ];
then
    echo -e "\n\n**************************\n\n\
            REBOOT AS SOON AS POSSIBLE\n\n\
            **************************\n\n"
    needreboot=1
fi

echo -e "\nNumber of pkgs:\n$cntr\n\nUpdated packages:\n$(cat $updateresults)"

if [ -f $updateresults ];
then
    rm -f $updateresults
fi

if [ $needreboot -gt 0 ];
then
    echo -e "\nFAKE REBOOT :) because needreboot is: $needreboot\n"
else
    echo -e "\nNo reboot required because needreboot is: $needreboot\n"
fi
