#!/bin/bash

DOTFILES=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
BASH_DIR="${DOTFILES}/bash"

# shellcheck source=/dev/null
source "${BASH_DIR}/_config.sh"

THIS_BACKUP="${BACKUP_DIR}/$(date '+%Y-%m-%d_%H:%M:%S')"

_cd "${HOME}"

backup_old() {
  OLD_PATH=${1}

  if [ ! -d "${THIS_BACKUP}" ]; then
    minor_step "Creating a backup folder for old contents: '${THIS_BACKUP}'"
    mkdir -p "${THIS_BACKUP}"
  fi

  minor_step "Moving old ${OLD_PATH} into ${THIS_BACKUP}/${OLD_PATH}"
  mv "${OLD_PATH}" "${THIS_BACKUP}/${OLD_PATH}"

  continue_if_succeeded
}

create_symlink() {
  SYMLINK_TO=${1}

  minor_step "${SYMLINK_TO}"
  ln -s "${DOTFILES}/${SYMLINK_TO}" "${SYMLINK_TO}"

  continue_if_succeeded
}

step "Adding \$PATH into .bash_paths"
echo "export DOTFILES=\"${DOTFILES}\"" >>${DOTFILES}/.bash_paths
echo "export PATH=\"\${DOTFILES}/commands:\$PATH\"" >>${DOTFILES}/.bash_paths

step "Backing up old contents"
for PATH_TO in "${PATHS_TO_PROCESS[@]}"; do
  if [ -f "${PATH_TO}" ] || [ -d "${PATH_TO}" ]; then
    backup_old "${PATH_TO}"
  fi
done
continue_if_succeeded

step "Creating symlinks"
for PATH_TO in "${PATHS_TO_PROCESS[@]}"; do
  create_symlink "${PATH_TO}"
done
continue_if_succeeded

_cd "${DOTFILES}"

step "Git assume no change"
git update-index --assume-unchanged "${DOTFILES}"/.ssh/authorized_keys
continue_if_succeeded

step "Copying old 'id_rsa'"
cp "${THIS_BACKUP}"/.ssh/id_rsa "${DOTFILES}"/.ssh/id_rsa
continue_if_succeeded

all_done

info "Remember to re-open terminal!"
