ROOT_DIR=$(dirname `realpath $0`)

# Install base packages
sudo add-apt-repository universe
sudo apt update -y && sudo apt upgrade -y

## base tools
sudo apt-get install -y \
    build-essential procps file \
    curl wget git vim xclip bash-completion \
    gnome-tweaks gnome-terminal gnome-shell-extensions \
    fio pwgen

## installer tools
sudo apt-get install -y \
    golang-go snapd 

### brew
test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >> ~/.bashrc


# ssh-key
ssh-keygen -t rsa -C "kienlt"

# Init Home - Create personal dirs
${ROOT_DIR}/home/init.sh

# Install packages
for package in $(ls ${ROOT_DIR}/packages/ubuntu); do
    bash ${ROOT_DIR}/packages/ubuntu/${package}
done
