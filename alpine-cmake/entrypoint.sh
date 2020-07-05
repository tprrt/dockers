#!/bin/bash

set -x

# Add local user
USER_ID=${LOCAL_USER_ID:-9001}
USER_NAME=${LOCAL_USER_NAME:-user}
USER_GROUPS="users"
USER_HOME=/home/${USER_NAME}

# Create the user
useradd --shell /bin/bash -u ${USER_ID} -m ${USER_NAME} --home ${USER_HOME} --groups ${USER_GROUPS} \
    || echo "${USER_NAME} Already exist"

# Check the user id
if [[ "$(cat /etc/passwd|grep ${USER_NAME}|cut -f3 -d":")" != "${USER_ID}" ]] ; then
    echo "Unable to add the local user"
    exit 1
fi

# Switch to the local user
su - ${USER_NAME} -c $@ || { echo "Unable to swith to the local user" ; exit 1 ; }
