ROOT_DIR=$(dirname `realpath $0`)

# Create personal dirs
${ROOT_DIR}/home/init.sh

# For terminal emulator
${ROOT_DIR}/terminal/setup.sh

# Setup home
${ROOT_DIR}/home/setup.sh

# Gnome config
gsettings set org.gnome.desktop.background picture-uri file://${ROOT_DIR}/utils/image/background.jpg