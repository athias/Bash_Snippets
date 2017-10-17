#!/bin/bash
################################################################################
#
# pid_watch.sh
#
#     * This script is intended to be sourced from another script
#     * All variables within this function are pre-pended with PW_ to ensure
#       compatibility with most other scripts
#     * The default sleep time is 30 seconds
#
# Function Usage:
#     pid_watch (pid) [sleep_seconds]
#
# examples:
#     pid_watch 2345 45
#         Check pid 2345 for completion and report every 45 seconds
#     (command_to_watch) & pid_watch $! 25
#         Check the pid for (command_to_watch) and report every 25 seconds
#     (command_to_watch) > (log_of_command) 2>&1 & pid_watch $! 25
#     cat (log_of_command)
#         Check the pid for (command_to_watch) and report every 25 seconds
#         While running the (log_of_command) is capturing the output
#
#
################################################################################
# pid_watch Function
################################################################################

pid_watch ()
{

# Verify a pid to watch has been provided
if [[ ! ${1} ]];then
  printf "\e[0;33mERROR:\e[0m\tThe pid_watch function must be called with \$\{1\}\n"
  exit 1
fi

# If a sleep amount has been provided, verify it is a valid number
if [[ ${2} ]];then
  PW_RE_NUM='^[0-9]+$'
  if [[ ${2} =~ ${PW_RE_NUM} ]];then
    PW_SLEEP_TIME=${2}
  else
    printf "\e[0;33mERROR:\e[0m\tThe \$\{2\}\ option must be a valid number\n"
    exit 1
  fi
else
  # Set Default time if one isn't specified
  PW_SLEEP_TIME=30
fi

# Monitor pid based on sleep timer and report status
PW_FIRST_RUN="yes"
while [[ -n $(ps -f h -p ${1}) ]];do
  if [[ ${PW_FIRST_RUN} == "yes" ]];then
    printf "\t\e[0;33mStarted monitoring Pid \e[0;36m${1} \e[0;33m- checking status in \e[0;36m${PW_SLEEP_TIME} \e[0;33mseconds...\e[0m\n"
    sleep ${PW_SLEEP_TIME}
    PW_FIRST_RUN="no"
  else
    printf "\t\e[0;33mPid \e[0;36m${1} \e[0;33mis still running, checking again in \e[0;36m${PW_SLEEP_TIME} \e[0;33mseconds...\e[0m\n"
    sleep ${PW_SLEEP_TIME}
  fi
done

# Report Success
printf "\t\e[0;33mPid \e[0;36m${1} \e[0;33mhas finished running!\e[0m\n"

}

################################################################################
# Display Usage in case someone just runs it
################################################################################

printf "\n\e[0;34mWelcome to the pid_watch function!\e[0m\n"
cat << EOF

    * This script is intended to be sourced from another script
    * All variables within this function are pre-pended with PW_ to ensure
      compatibility with most other scripts
    * The default sleep time is 30 seconds

Function Usage:
    pid_watch (pid) [sleep_seconds]

Examples:
    pid_watch 2345 45
        Check pid 2345 for completion and report every 45 seconds
    (command_to_watch) & pid_watch $! 25
        Check the pid for (command_to_watch) and report every 25 seconds
    cat (log_of_command)
        Check the pid for (command_to_watch) and report every 25 seconds
        While running the (log_of_command) is capturing the output

EOF

exit 0

################################################################################
# End of Script
################################################################################
