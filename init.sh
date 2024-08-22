ROOT_DIR=$(dirname $(realpath $0))

if [[ -z "$1" ]]; then
  echo 'Missing first arg for `DEVICE_TYPE`'
  exit 1
elif [[ "$1" != "PC" ]] && [[ "$1" != "SERVER" ]]; then
  echo "First arg - \`DEVICE_TYPE\` must be \`PC\` or \`SERVER\`, not \`${1}\`"
  exit 1
else 
  DEVICE_TYPE=${1}
fi

# Create personal dirs
${ROOT_DIR}/home/init.sh

# For terminal emulator
${ROOT_DIR}/terminal/setup.sh

# Setup home
${ROOT_DIR}/home/setup.sh

# Gnome config
${ROOT_DIR}/gnome/setup.sh