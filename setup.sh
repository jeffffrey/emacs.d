#!/bin/bash

# Setup minimal emacs-based development environment under ubuntu desktop/server (14.04)


function isyes ()
{
  while true
  do
    cat <<EOF
==========================================
  $1
==========================================
EOF
    read response
    case $response in
      y|yes|Y|Yes|YES|sure|whatthehell)
        return 0
        ;;
      n|no|N|No|NO|fugedaboudit|hellno)
        return 1
        ;;
      *)
        echo "\"$response\" is invalid, please respond yes or no"
        ;;
    esac

  done
}


# sanity check of the prerequisites

[ -e /etc/lsb-release ] || exit 1
. /etc/lsb-release

[ "$DISTRIB_CODENAME" = "trusty" ] || exit 1

# install essential packages
sudo apt-get install git vim emacs24 build-essential

# clone emacs configuration 
cd ~
mkdir workspace
cd workspace
git clone https://github.com/jeffffrey/emacs.d.git

# copy emacs setting to right place


