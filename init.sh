export ROOT_DIR=$(dirname $(realpath $0))

DISTRO_ID=$(lsb_release --id | sed 's/Distributor ID:\s//')
if [[ ${DISTRO_ID} != "Ubuntu" ]]; then
  echo "Not supported for \`${DISTRO_ID}\`"
  exit 1
fi

if [[ -z "$1" ]]; then
  echo 'Missing first arg for `DEVICE_TYPE`'
  exit 1
elif [[ "$1" != "PC" ]] && [[ "$1" != "SERVER" ]]; then
  echo "First arg - \`DEVICE_TYPE\` must be \`PC\` or \`SERVER\`, not \`${1}\`"
  exit 1
else 
  export DEVICE_TYPE=${1}
fi

exit 1

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