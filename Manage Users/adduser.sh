#!/bin/bash
# adduser -- Adds a new user to the system, including building their home directory, copying in default config data, etc.
# For a standard Linux/Unix system, not OS X
# Define variables for important system files and directories
pwfile='/etc/passwd'
shadowfile='/etc/shadow'
gfile='/etc/group'
hdir='/home'
# ensure the script is run with root privileges
if [ "$(id -un)" != "root" ] ; then
    echo "Error: You must be root to run this command." >&2
    exit 1
fi 
# prompt the administrator to enter the username (login) for the new user
echo "Add new user account to $(hostname)"
echo -n "login: "   ; read login # -n: ensure the echo command does not print a new line, so the read command input stays the same line
# The next line sets the highest possible user ID value at 5000, you can adjust this number to match the top end of your user ID range 
uid="$(awk -F: '{ if (big < $3 && $3 < 5000) big=$3} END { print big + 1}' $pwfile)"
# awk -F: process the /etc/passwd file using : as the field separator
# find the largest UID under 5000, returns the next available UID
homedir=$hdir/$login # define the path for the new user’s home directory based on the login name
gid=$uid # assign the new user their own group ID, identical to the UID
echo -n "full name: "   ; read fullname 
echo -n "shell: "        ; read shell 
# add the new user to the /etc/passwd file
echo "Setting up account $login for $fullname..."
echo ${login}:x:${uid}:${gid}:${fullname}:${homedir}:$shell >> $pwfile 
echo ${login}:*:11647:0:99999:7::: >> $shadowfile # add the user’s password-related entry to /etc/shadow, * indicates no password is currently set
echo "${login}:x:${gid}:$login" >> $gfile  # add the user to /etc/group, x placeholder for the group password
# create and configures the user’s home directory
mkdir $homedir
cp -R /etc/skel/.[a-zA-Z]* $homedir # copy default configuration files from /etc/skel to the home directory
chmod 755 $homedir # set permissions so that the owners has full access, while others can only read and execute
chown -R ${login}:${login} $homedir # change ownership of the home directory and its contents to the new user
# Setting an initial password. 
exec passwd $login 