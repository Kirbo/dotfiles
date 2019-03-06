#!/bin/bash

# Paths
BASH_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
ROOT_DIR=$(dirname "${BASH_DIR}")
COMMANDS_DIR="${ROOT_DIR}/commands"
BACKUP_DIR="${ROOT_DIR}/backups"

# Includes
source ${BASH_DIR}/colors.sh
source ${BASH_DIR}/functions.sh
