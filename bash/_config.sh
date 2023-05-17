#!/bin/bash

# Paths
# shellcheck source=/dev/null
COMMANDS_DIR="${DOTFILES}/commands"
BACKUP_DIR="${DOTFILES}/backups"

# Includes
source "${BASH_DIR}/colors.sh"
source "${BASH_DIR}/functions.sh"
source "${BASH_DIR}/bash_command_timer.sh"

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

export COMMANDS_DIR
export BACKUP_DIR
export KEY_EXTENSION
export PATHS_TO_PROCESS
