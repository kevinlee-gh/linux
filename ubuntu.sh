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
    sudo apt-get install -qqy gnome-tweaks gnome-terminal gnome-shell-extensions gnome-shell-extension-manager
    sudo pip install -qU gnome-extensions-cli
)

( # brew
    if [ -d /usr/lib/homebrew ]; then rm -rf /usr/lib/homebrew; fi

    mkdir -p /usr/lib/homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /usr/lib/homebrew
    ln -sf /usr/lib/homebrew/bin/brew /usr/bin
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