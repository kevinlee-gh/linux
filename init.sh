#!/bin/bash

# Create personal dirs
${ROOT_DIR}/home/init.sh

# For terminal emulator
${ROOT_DIR}/terminal/setup.sh

# Setup home
${ROOT_DIR}/home/setup.sh

# Gnome config - GUI of linux
if [[ "$DEVICE_TYPE" == "PC" ]]; then
  ${ROOT_DIR}/gnome/setup.sh
fi