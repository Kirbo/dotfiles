#!/bin/bash

# Paths
COMMANDS_DIR="${DOTFILES}/commands"
BACKUP_DIR="${DOTFILES}/backups"

# Includes
source ${BASH_DIR}/colors.sh
source ${BASH_DIR}/functions.sh

# Variables
KEY_EXTENSION='pub'
PATHS_TO_PROCESS=(
  '.bash_aliases'
  '.bash_paths'
  '.bash_profile'
  '.bashrc'
  '.inputrc'
  '.npmrc'
  '.ssh'
)
