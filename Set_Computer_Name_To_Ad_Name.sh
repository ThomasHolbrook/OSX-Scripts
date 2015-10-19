#! /bin/bash

###
# Computer name cleanup - v0.1 - Thomas Holbrook
###

shopt -s nocasematch

cutfqdn=`sudo /usr/libexec/PlistBuddy -c "print :ActiveDirectory:fully-qualified\ domain\ name:" /Library/Preferences/OpenDirectory/DynamicData/Active\ Directory/JIGSAWSYSTEMS.plist | head -n1 | cut -d "." -f1`

echo "AD FQDN is $cutfqdn"

cutfqdnNoWS="${cutfqdn//[[:space:]]/}"

echo "Clean FQDN is $cutfqdnNoWS"

currentComputerName=`sudo scutil --get ComputerName`
echo "Current computer name is $currentComputerName"

currentLocalHostName=`sudo scutil --get LocalHostName`
echo "Current local host name is $currentLocalHostName"

currentHostName=`sudo scutil --get HostName`
echo "Current host name is $currentLocalHostName"

currentBashHN=`hostname`
echo "Current host name is $currentBashHN"

if [[ $cutfqdn != "macbook air"* ]] && [[ $cutfqdn != "" ]]; 

    then

        if [ "$currentComputerName" = "$cutfqdn" ]; then

          echo "Current computer name is OK"

          else 

          echo "Incorrect Current computer name updateing"

          sudo scutil --set ComputerName $cutfqdn

        fi

        if [ "$currentLocalHostName" = "$cutfqdn" ]; then

          echo "Current local host name name is OK"

          else 

          echo "Incorrect Current local host name updateing"

          sudo scutil --set LocalHostName $cutfqdn

        fi

        if [ "$currentHostName" = "$cutfqdn" ]; then

          echo "Current host name name is OK"

          else 

          echo "Incorrect Current  host name updateing"

          sudo scutil --set HostName $cutfqdn

        fi

        if [ "$currentBashHN" = "$cutfqdn" ]; then

          echo "Current host name name is OK"

          else 

          echo "Incorrect Current  host name updateing"

          sudo hostname $cutfqdn

        fi

        exit 0

    else

        echo "Are we bound to AD? / Not Bound as macbook air?"

        exit 1

fi
