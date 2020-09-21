#!/bin/bash

read -p "Enter a user name: " USER
echo "Archiving user: $USER"

#lock the account
passed -l $USER

#Create an archive of the home directory.
tar cf /app/user_archives/${USER}.tar.gz /home/${USER}
zip -r /app/user_archives/${USER}.zip /home/${USER}
