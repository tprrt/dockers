#!/bin/bash

set -x

# Enable ccache
export USE_CCACHE=1
export CCACHE_DIR=${HOME}/.ccache
export PATH="/usr/lib/ccache/:${PATH}"

# Add user into kvm group
KVM_GID=${LOCAL_KVM_ID:-9002}

if [ -z $(sed -nr "s/^kvm:x:([0-9]+):.*/\1/p" /etc/group) ] ; then
    groupadd --system --gid ${KVM_GID} kvm || { echo "Unable to create the KVM group to the system" ; exit 1 ; }
fi

# Add local user
USER_ID=${LOCAL_USER_ID:-9001}
USER_NAME=${LOCAL_USER_NAME:-user}
USER_GROUPS="users,sudo,dialout,kvm"
USER_HOME=/home/${USER_NAME}

# Create the user
useradd --shell /bin/bash -u ${USER_ID} -m ${USER_NAME} --home ${USER_HOME} --groups ${USER_GROUPS} \
    || echo "${USER_NAME} Already exist"

# Check the user id
if [[ "$(cat /etc/passwd|grep ${USER_NAME}|cut -f3 -d":")" != "${USER_ID}" ]] ; then
    echo "Unable to add the local user"
    exit 1
fi

# Edit sudoer to add NOPASSWD attribut at the user permission
echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers || { echo "Unable to edit sudoer" ; exit 1 ; }

# Switch to the local user
su - ${USER_NAME} || { echo "Unable to swith to the local user" ; exit 1 ; }
