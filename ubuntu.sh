ROOT_DIR=$(dirname `realpath $0`)

# Install base packages
sudo add-apt-repository -ny universe
sudo apt update -qq && sudo apt upgrade -qqy

## base tools
sudo apt-get install -qqy \
    build-essential procps file screenfetch \
    curl wget git vim xclip bash-completion tree \
    fio pwgen htop python3-pip

## installer tools
sudo apt-get install -qqy \
    golang-go snapd 

( # gnome 
    # NOTE moved to gnome
    sudo apt-get install -qqy gnome-tweaks gnome-terminal gnome-shell-extensions gnome-shell-extension-manager
    sudo pip install -qU gnome-extensions-cli
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