#!/bin/bash

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

useradd --shell /bin/bash -u ${USER_ID} -m ${USER_NAME} --home ${USER_HOME} --groups ${USER_GROUPS} \
	|| { echo "Unable to add the local user" ; exit 1 ; }


# Edit sudoer to add NOPASSWD attribut at the user permission
echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers || { echo "Unable to edit sudoer" ; exit 1 ; }

# Switch to the local user
su - ${USER_NAME} || { echo "Unable to swith to the local user" ; exit 1 ; }

# Download source
URI=${URI:-git@github.com:tprrt/exiguous-manifest.git}
BRANCH=${BRANCH:-master}
MANIFEST=${MANIFEST:-default.xml}

# Fetch sources
repo init -u $URI -b $BRANCH -m $MANIFEST || { echo "Unable to init the repo" ; exit 1 ; }
repo sync --force-sync || { echo "Unable to synchronize the repo" ; exit 1 ; }

# Initialize the environment
virtualenv venv || { echo "Unable to create the virtualenv" ; exit 1 ; }
source venv/bin/activate || { echo "Unable to activate the virtualenv" ; exit 1 ; }

# Install toaster requirements
pip install -r ./exiguous/bitbake/toaster-requirements.txt || { echo "Unable to install Toaster requirements" ; exit 1 ; }

# Start Toaster service
source exiguous-init-build-env || { echo "Unable to source environment" ; exit 1 ; }

TOASTER_CONF="../exiguous/meta-tprrt/meta-exiguous/conf/toasterconf.json" source ../exiguous/bitbake/bin/toaster webport="8000" || { echo "Unable to start Toaster" ; exit 1 ; }
