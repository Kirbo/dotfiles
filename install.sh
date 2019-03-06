#!/bin/bash

source bash/_config.sh

create_symlink () {
  SYMLINK_TO=${1}

  minor_step "${SYMLINK_TO}"
  ln -s "dotfiles/${SYMLINK_TO}" "${SYMLINK_TO}"

  continue_if_succeeded
}

step "Creating symlinks"
create_symlink '.ssh'
create_symlink '.npmrc'
create_symlink '.bash_aliases'
create_symlink '.bashrc'
create_symlink '.inputrc'

all_done
