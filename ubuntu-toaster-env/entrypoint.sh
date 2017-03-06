#!/bin/bash

# Enable ccache
export USE_CCACHE=1
export CCACHE_DIR=${HOME}/.ccache
export PATH="/usr/lib/ccache/:${PATH}"

# Add local user
USER_ID=${LOCAL_USER_ID:-9001}
USER_NAME=${LOCAL_USER_NAME:-user}
HOME=/home/${USER_NAME}
GROUPS="users sudo dialout"

echo "Starting with UID : '${USER_ID}' and name '${USER_NAME}'"

useradd --shell /bin/bash -u ${USER_ID} -o -c "" -m ${USER_NAME} --home ${HOME} --groups ${GROUPS} \
	|| { echo "Unable to add the local user" ; exit 1 ; }

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
