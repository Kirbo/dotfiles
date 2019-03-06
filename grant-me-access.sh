#!/bin/bash

AUTHORIZED_KEYS_EXIST=true

if [ ! -d "${HOME}/.ssh" ]; then
  mkdir $HOME/.ssh
  chmod u=rwx,go= $HOME/.ssh
fi

if [ ! -f "${HOME}/.ssh/authorized_keys" ]; then
  AUTHORIZED_KEYS_EXIST=false
fi

curl https://gitlab.com/kirbo/dotfiles/raw/master/.ssh/keys/MBP2015.remote >> ~/.ssh/authorized_keys

if [ !$AUTHORIZED_KEYS_EXIST ]; then
  chmod u=rw,go=r $HOME/.ssh/authorized_keys
fi
