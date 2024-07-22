ROOT_DIR=$(dirname `realpath $0`)

# Install base packages
sudo add-apt-repository universe
sudo apt update -y && sudo apt upgrade -y
sudo apt-get install -y \
    curl wget git vim golang-go snapd gnome-tweaks xclip bash-completion \
    fio guake gnome-terminal cargo

# ssh-key
ssh-keygen -t rsa -C "kienlt"

# Init Home - Create personal dirs
${ROOT_DIR}/home/init.sh

# Install packages
for package in $(ls ${ROOT_DIR}/packages/ubuntu); do
    bash ${ROOT_DIR}/packages/ubuntu/${package}
done
