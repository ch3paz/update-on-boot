#!/bin/bash

updateresults=/tmp/updateresults
needreboot=0

checkupdates > $updateresults

cntr=0
cntr=$(cat $updateresults | wc -l)

if [ "$(cat $updateresults | cut -d ' ' -f1 | grep -P '(^|\s)\Klinux(?=\s|$)')" == "linux" ];
then
    echo -e "\n**************************\nREBOOT AS SOON AS POSSIBLE\n**************************\n"
    needreboot=1
fi

if [ "$(cat $updateresults | cut -d ' ' -f1 | grep -P '(^|\s)\Knvidia(?=\s|$)')" == "nvidia" ];
then
    echo -e "\n**************************\nREBOOT AS SOON AS POSSIBLE\n**************************\n"
    needreboot=1
fi

echo -e "\nNumber of pkgs:\n$cntr\n\nUpdated packages:\n$(cat $updateresults)"

if [ -f $updateresults ];
then
    rm -f $updateresults
fi

if [ $needreboot -gt 0 ];
then
    # Comment this line if you comment-in the lines below
    echo -e "\nFAKE REBOOT :) because needreboot is: $needreboot\n"

    # Uncomment the next two lines if you want to REBOOT
    # the system WITHOUT ASKING YOU AGAIN when the linux-
    # or the nvidia-package are updated.
    #
    # You have be warned! ;)

    #echo -e "\nTrigger REBOOT NOW...\n"
    #touch /tmp/update-on-boot.reboot
else
    echo -e "\nNo reboot required because needreboot is: $needreboot\n"
fi
