#!/bin/bash
################################################################################
#
# ./sub_script_pid.sh
#
# Created by:	Matthew R. Sawyer
#
# Purpose:	Runs itself as a sub-script and tracks the pid of that script
#
################################################################################
# Establish Variables
################################################################################

# Normally you would put variables here, but we don't have any

################################################################################
# Function - A Function to run a series of sleep commands
################################################################################

# Root UID check
raven_rant ()
{
  printf "The Raven\n\n" > /tmp/raven.txt
  sleep 1
  printf "By Edgar Allan Poe\n\n" >> /tmp/raven.txt
  sleep 1
  printf "Once upon a midnight dreary, while I pondered, weak and weary,\n" >> /tmp/raven.txt
  sleep 1
  printf "Over many a quaint and curious volume of forgotten lore\—\n" >> /tmp/raven.txt
  sleep 1
  printf "    While I nodded, nearly napping, suddenly there came a tapping,\n" >> /tmp/raven.txt
  sleep 1
  printf "As of some one gently rapping, rapping at my chamber door.\n" >> /tmp/raven.txt
  sleep 1
  printf "\“\’Tis some visitor,\” I muttered, \“tapping at my chamber door\—\n" >> /tmp/raven.txt
  sleep 1
  printf "            Only this and nothing more.\”\n" >> /tmp/raven.txt
  sleep 1
  printf "\n" >> /tmp/raven.txt
  sleep 1
  printf "    Ah, distinctly I remember it was in the bleak December\;\n" >> /tmp/raven.txt
  sleep 1
  printf "And each separate dying ember wrought its ghost upon the floor.\n" >> /tmp/raven.txt
  sleep 1
  printf "    Eagerly I wished the morrow\;\—vainly I had sought to borrow\n" >> /tmp/raven.txt
  sleep 1
  printf "    From my books surcease of sorrow—sorrow for the lost Lenore\—\n" >> /tmp/raven.txt
  sleep 1
  printf "For the rare and radiant maiden whom the angels name Lenore\—\n" >> /tmp/raven.txt
  sleep 1
  printf "            Nameless here for evermore.\n" >> /tmp/raven.txt
  sleep 1
  printf "\n" >> /tmp/raven.txt
  sleep 1
  printf "    And the silken, sad, uncertain rustling of each purple curtain\n" >> /tmp/raven.txt
  sleep 1
  printf "Thrilled me—filled me with fantastic terrors never felt before\;\n" >> /tmp/raven.txt
  sleep 1
  printf "    So that now, to still the beating of my heart, I stood repeating\n" >> /tmp/raven.txt
  sleep 1
  printf "    \“\’Tis some visitor entreating entrance at my chamber door\—\n" >> /tmp/raven.txt
  sleep 1
  printf "Some late visitor entreating entrance at my chamber door\;\—\n" >> /tmp/raven.txt
  sleep 1
  printf "            This it is and nothing more.\”\n" >> /tmp/raven.txt
  sleep 1
  printf "\n\nThat's all for now!\n\n" >> /tmp/raven.txt
  exit
}

################################################################################
# Beginning of Main Script
################################################################################

if [[ ${1} == "Das_ist_das_geheime_wort" ]];then
  raven_rant
else
  if [[ -f ./sub_script_pid.sh ]];then
    printf "\n\e[0;36mCreating a sub-script based on the following parameters:\e[0m\n"
    printf "\t/bin/bash ./sub_script_pid.sh Das_ist_das_geheime_wort & export SUB_PID=\"$!\"\n\n"
    /bin/bash ./sub_script_pid.sh Das_ist_das_geheime_wort & export SUB_PID="$!"
    printf "\e[0;36mThe sub-script was run using the following PID:\e[0m\n"
    printf "\t\e[0;32m${SUB_PID}\e[0m\n\n"
    printf "\e[0;36mYou can clearly see the PID running below:\e[0m\n"
    ps -f -p ${SUB_PID}
    printf "\n\e[0;32mHave a nice Day!\e[0m\n\n"
    exit
  else
    printf "\nThis is never going to work, just give it up\n"
    exit
  fi
fi
 
################################################################################
# End of Script
################################################################################
