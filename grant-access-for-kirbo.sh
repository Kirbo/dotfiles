#!/bin/bash

GREEN="\033[32m"
NORMAL="\033[0m"

step() {
  echo -e "${GREEN}***${NORMAL} ${@}"
}

all_done() {
  echo -e "  ${GREEN}✔${NORMAL} All done"
}

AUTHORIZED_KEYS_EXIST=true

if [ ! -d "${HOME}/.ssh" ]; then
  step "Directory '${HOME}/.ssh' not found, creating it."
  mkdir "${HOME}/.ssh"
  chmod u=rwx,go= "${HOME}/.ssh"
fi

if [ ! -f "${HOME}/.ssh/authorized_keys" ]; then
  AUTHORIZED_KEYS_EXIST=false
fi

echo >>"${HOME}/.ssh/authorized_keys"
echo "# The next keys are for Kirbos access" >>"${HOME}/.ssh/authorized_keys"

step "Adding the contents of 'https://gitlab.com/kirbo/dotfiles/raw/master/.ssh/keys/MBP2022.pub' into '${HOME}/.ssh/authorized_keys'"
curl -s https://gitlab.com/kirbo/dotfiles/raw/master/.ssh/keys/MBP2022.pub >>"${HOME}/.ssh/authorized_keys"

step "Adding the contents of 'https://gitlab.com/kirbo/dotfiles/raw/master/.ssh/keys/MBP2015.pub' into '${HOME}/.ssh/authorized_keys'"
curl -s https://gitlab.com/kirbo/dotfiles/raw/master/.ssh/keys/MBP2015.pub >>"${HOME}/.ssh/authorized_keys"

echo "# End of Kirbos keys" >>"${HOME}/.ssh/authorized_keys"
echo >>"${HOME}/.ssh/authorized_keys"

if [ "$AUTHORIZED_KEYS_EXIST" = false ]; then
  step "File '${HOME}/.ssh/authorized_keys' didn't exist earlier, fixing the file permissions."
  chmod u=rw,go=r "${HOME}/.ssh/authorized_keys"
fi

all_done
