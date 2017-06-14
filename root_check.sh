#!/bin/bash
################################################################################
#
# ./root_check.sh
#
# Created by:	Matthew R. Sawyer
#
# Purpose:	Determines whether the user is root and acts accordingly
#
################################################################################
# Establish Variables
################################################################################

# Normally you would put variables here, but we don't have any

################################################################################
# Function - Verify the script is being run by root
################################################################################

# Root UID check
root_uid_check ()
{
  # Check if the user's EUID is anything other than zero (root)
  if [[ ${EUID} != "0" ]];then
    # Message for non-root users
    printf "\n\e[0;31mERROR:\e[0m\tYou are not Root, begone peasant ${EUID}!\n"
    # Give a different 
    exit 1
  else
    # Message for Root
    printf "\n\e[0;32mWINNING:\e[0m\tYou are indeed, Root!\n"
  fi
}

################################################################################
# Beginning of Main Script
################################################################################

# Run the Function
root_uid_check

# Special Message for Root
printf "\n"
printf "\e[0;37mWelcome oh great Root, you may now bask in your\e[0m\n"
printf "\e[0;31m  _____ _      ____  _______     __\e[0m\n"
printf "\e[0;32m / ____| |    / __ \\|  __ \\ \\   / /\e[0m\n"
printf "\e[0;33m| |  __| |   | |  | | |__) \\ \\_/ / \e[0m\n"
printf "\e[0;34m| | |_ | |   | |  | |  _  / \\   /  \e[0m\n"
printf "\e[0;35m| |__| | |___| |__| | | \\ \\  | |   \e[0m\n"
printf "\e[0;36m \\_____|______\\____/|_|  \\_\\ |_|   \e[0m\n"
                                   
################################################################################
# End of Script
################################################################################
