#!/bin/bash

# add local user
USER_ID=${LOCAL_USER_ID:-9001}
USER_NAME=${LOCAL_USER_NAME:-user}
HOME=/home/${USER_NAME}

echo "Starting with UID : '${USER_ID}' and name '${USER_NAME}'"

useradd --shell /bin/bash -u ${USER_ID} -o -c "" -m ${USER_NAME} --home ${HOME}

export USE_CCACHE=1
export CCACHE_DIR=${HOME}/.ccache
export PATH="/usr/lib/ccache/:${PATH}"

su - ${USER_NAME}
