#!/bin/bash
################################################################################
#
# ./password_test.sh
#
# Created by:	Matthew R. Sawyer
#
# Purpose:	Part 1 - Verifies user input of password matches
#		Part 2 - Compares password to an existing password hash
# Use Case:	Part 1 - Verify input for operations requiring a password
#		Part 2 - Require a password to run specific sections of a script
#
# Important Notes:
#	Password tested is:
#		P@ssw0rd!2
#	Password was written to a file using the following command:
#		# echo -e 'P@ssw0rd!2' > pw.txt
#	Hash was pulled from the file using the following command:
#		# sha512sum pw.txt | awk '{print $1}'
#
################################################################################
# Establish Variables
################################################################################

# Original Password
ORIG_PW="P@ssw0rd!2"
# Resulting Password hash from the important notes section is below
VERIFY_HASH="26f3d4b083b9bd7cb0222abeb520023051f27801ec51da606e4fd0687ebbac04932ee029bf8393ee2efb2ba17b25e57b1db573b64247d4a24ce786ee8bf727f1"
# Start by assuming the passwords do not match
PW_MATCH="no"

################################################################################
# Part 1 - Input Passwords and verify they match
################################################################################

# Header to let people know what to do
printf "\n\e[0;36m## Password input validation ##\e[0m\n\n"

# Run until the passwords input match
while [[ ${PW_MATCH} != "yes" ]];do

  # Request Passwords Inputs
  printf "\e[0;35mPlease Input the User Password:\e[0m\n"
  read -s PW
  printf "\e[0;35mPlease Verify the User Password:\e[0;m\n"
  read -s PW_VERIFY

  # Display the values - used for troubleshooting issues
  printf "\nYour Input Password:\t${PW}\n"
  printf "Your Verify Password:\t${PW_VERIFY}\n"
  # Check if the passwords match and act accordingly
  if [[ ${PW} == ${PW_VERIFY} ]];then
    printf "\n\e[0;32mThe passwords match!\e[0m\n"
    PW_MATCH="yes"
  elif [[ ${PW} != ${PW_VERIFY} ]];then
    printf "\n\e[0;31mThe passwords do not match, please try again\e[0m\n\n"
  fi
done

################################################################################
# Part 1 - Input Passwords and verify they match
################################################################################

# Header to let people know what to do
printf "\n\e[0;36m## Password hash comparison ##\e[0m\n\n"

# Hash the password
echo -e "${PW}" > /var/tmp/temp_pw.txt
PW_HASH=`sha512sum /var/tmp/temp_pw.txt | awk '{print $1}'`

# Display the values - used for troubleshooting issues
printf "Your Input Password is:\t${PW}\n"
printf "Your PW is storad as:\t"
cat /var/tmp/temp_pw.txt
printf "\nThe Hashed Password is:\t${ORIG_PW}\n\n"
printf "Your Input PW Hash is:\t${PW_HASH}\n"
printf "The Stored PW Hash is:\t${VERIFY_HASH}\n\n"

# Remove the temporary file
rm -f /var/tmp/temp_pw.txt

# Check if the password hashes match and act accordingly
if [[ ${PW_HASH} == ${VERIFY_HASH} ]];then
  printf "\e[0;32mCongratulations, the password matches the hashed value\e[0m\n\n"
else
  printf "\e[0;31mThe password you entered did not match the stored password\e[0m\n\n"
fi

################################################################################
# End of Script
################################################################################

