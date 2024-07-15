FILE_DIR=$(dirname `realpath $0`)

# Create personal dirs
${FILE_DIR}/home/init.sh

# For terminal emulator
${FILE_DIR}/terminal/setup.sh

# Setup home
${FILE_DIR}/home/setup.sh