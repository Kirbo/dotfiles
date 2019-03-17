#!/bin/bash

ROOT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
BASH_DIR="${ROOT_DIR}/bash"

source ${BASH_DIR}/_config.sh

cd $HOME

backup_old () {
  OLD_PATH=${1}

  if [ ! -d "${BACKUP_DIR}" ]; then
    minor_step "Creating a backup folder for old contents: '${BACKUP_DIR}'"
    mkdir -p "${BACKUP_DIR}"
  fi

  minor_step "Moving old ${OLD_PATH} into ${BACKUP_DIR}/${OLD_PATH}"
  mv "${OLD_PATH}" "${BACKUP_DIR}/${OLD_PATH}"

  continue_if_succeeded
}

create_symlink () {
  SYMLINK_TO=${1}

  minor_step "${SYMLINK_TO}"
  ln -s "${ROOT_DIR}/${SYMLINK_TO}" "${SYMLINK_TO}"

  continue_if_succeeded
}

step "Adding \$PATH into .bashrc"
echo "export PATH=\"${ROOT_DIR}/commands:\$PATH\"" >> ${ROOT_DIR}/.bashrc

step "Backing up old contents"
for PATH_TO in ${PATHS_TO_PROCESS[@]}; do
  if [ -f $PATH_TO ] || [ -d $PATH_TO ]; then
    backup_old "${PATH_TO}"
  fi
done
continue_if_succeeded

step "Creating symlinks"
for PATH_TO in ${PATHS_TO_PROCESS[@]}; do
  create_symlink "${PATH_TO}"
done
continue_if_succeeded

all_done
