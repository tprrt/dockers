#!/bin/bash
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

# Copyright (C) 2020 Thomas Perrot <thomas.perrot@tupi.fr>

umask 022

# Set environment
declare -A _ENV

_ENV['NAME']=$(basename $0)

_ENV['IP']=""
_ENV['SUBNET']=""

_ENV['NEEDED_BINARIES']="dnsmasq ip iptables"

_ENV['DRYRUN']=""
_ENV['DEBUG']=""


function _usage() {
        cat - <<EOF
Usage:
  $1 [options]
Options:

  -n, --dry-run  Dry-run mode
  -d, --debug    Print debug message
  -h, --help     Print help
EOF
}

function _die() {
    echo "\033[0;31m[$(date +%d%m%Y\ %H:%M:%S)] ${_ENV['NAME']} fatal: $@ \033[0m" >&2
    exit 1
}


function _error() {
    echo "\033[0;31m[$(date +%d%m%Y\ %H:%M:%S)] ${_ENV['NAME']} error: $@ \033[0m" >&2
    return 1
}


function _info() {
    echo "\033[0;0m[$(date +%d%m%Y\ %H:%M:%S)] ${_ENV['NAME']} info: $@ \033[0m"
    return 0
}


function _exec() {
    local status=1

    if [[ -z ${_ENV['DRYRUN']} ]] ; then
        echo $@
        eval $@ ; status=$?
    else
        eval $@ ${_ENV['DRYRUN']} 2>/dev/null ; status=$?
        if [ $status -eq 0 ] ; then
            echo $@ ${_ENV['DRYRUN']}
        else
            echo $@
            status=0
        fi
    fi
    return $status
}


# -----------------------------------------------------------------------------
# Main function
# -----------------------------------------------------------------------------


# Parse parameter and options
if [ $# -gt 4 ] ; then
    _usage ${_ENV['NAME']}
    exit 1
fi

while [[ $# > 0 ]]; do
    case $1 in
        -d|--debug)
            _ENV['DEBUG']="--debug";
            set -x
            ;;
        -h|--help)
            _usage ${_ENV['NAME']};
            exit 0
            ;;
        -n|--dry-run)
            _ENV['DRYRUN']="--dry-run"
            ;;
        *)
            _usage ${_ENV['NAME']};
            exit 1
            ;;
    esac
    shift
done

# Check available binaries
for bin in ${_ENV['NEEDED_BINARIES']} ; do
    which "${bin}" >/dev/null || _die "command '$bin' is missing"
done

if [ ! -d "/tftp" ] && [ -z "${_ENV['DRYRUN']}" ] ; then
    _die "tftp folder does not exist"
fi

# Get network information
_ENV['IP']=$(ip addr show dev eth0 | awk -F '[ /]+' '/global/ {print $3}')
_ENV['SUBNET']=$(echo ${_ENV['IP']} | cut -d '.' -f 1,2,3)

# Configure iptables
_exec "iptables -t nat -A POSTROUTING -j MASQUERADE" || _die "Unable to configure iptables"

_exec "cp /tmp/syslinux-4.07/core/pxelinux.0 /tftp/pxelinux.0" \
    || _die "Unable to copy pxelinux binary"

_exec "dnsmasq --interface=eth0 \
        --dhcp-range=${_ENV['SUBNET']}.101,${_ENV['SUBNET']}.199,255.255.255.0,1h \
        --dhcp-boot=pxelinux.0,pxeserver,${_ENV['IP']} \
        --pxe-service=x86PC,\"Install Linux\",pxelinux \
        --enable-tftp --tftp-root=/tftp \
        --dhcp-option=6,${_ENV['IP']} \
        --no-daemon" \
      || _die "Unable to start dnsmasq"

# Should be never reached
exit 0
