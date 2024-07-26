ROOT_DIR=$(dirname `realpath $0`)

# Install base packages
sudo add-apt-repository universe -y
sudo apt update -y && sudo apt upgrade -y

## base tools
sudo apt-get install -y \
    build-essential procps file \
    curl wget git vim xclip bash-completion tree \
    fio pwgen htop

## installer tools
sudo apt-get install -y \
    golang-go snapd 

( # gnome
    sudo apt-get install -y gnome-tweaks gnome-terminal gnome-shell-extensions gnome-shell-extension-manager
    
    wget -O $ROOT_DIR/tmp/gnome-shell-extension-installer "https://github.com/brunelli/gnome-shell-extension-installer/raw/master/gnome-shell-extension-installer"
    chmod +x $ROOT_DIR/tmp/gnome-shell-extension-installer
    mv $ROOT_DIR/tmp/gnome-shell-extension-installer ~/.local/bin/
)

( # brew
    if [ -d ~/.local/lib/homebrew ]; then rm -rf ~/.local/lib/homebrew; fi

    mkdir -p ~/.local/lib/homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/.local/lib/homebrew
    ln -sf ~/.local/lib/homebrew/bin/brew ~/.local/bin
)

( # ssh-key
    TYPE=rsa
    ssh-keygen -t $TYPE -C "kienlt" -N '' -f ~/.ssh/$TYPE
)

# Init Home - Create personal dirs
${ROOT_DIR}/home/init.sh

# Install packages
for package in $(ls ${ROOT_DIR}/packages/ubuntu); do
    bash ${ROOT_DIR}/packages/ubuntu/${package}
done

# Setup Personal Home
${ROOT_DIR}/init.sh