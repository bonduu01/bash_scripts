#!/bin/bash

read -p "Enter username:" USER

#read -p  "Your user? (y/n):" ANS

function confirmUser() {
 USERS=(ls /home) 
}

if [ $ANS == "n" ]
then
  echo "wrong user: ${USER}"
  exit 1
fi

USER_HOME="/home/"

function backup() {
 # This function creates a backup of a file.

 # Make sure the file exists.
 if [ -f "$1" ]
 then
   # Make the backup file variable local to this function.
   local BACKUP_FILE="/tmp/$(basename ${1}).$(date +%F).$$"
   echo "Backing up $1 to ${BACKUP_FILE}"

   # The exit status of the function will be the exit status of the cp command.
   cp $1 $BACKUP_FILE
 else
   # The file does not exist, so return a non zero exit status.
   return 1
 fi
}

# Call the function
#backup /app/bash_scripts/CH1/functions/funcHello.sh

read -p "Enter backup directory path:" DIR_PATH

echo $DIR_PATH

backup $DIR_PATH

# Make a decision based on the exit status of the function.
# Note this is for demonstration purposes.  You could have
# put this functionality inside of the backup_file function.
if [ $? -eq "0" ]
then
  echo "Backup succeeded!"
else
  echo "Backup failed!"
  # Abort the script and return a non-zero exit status.
  exit 1
fi
