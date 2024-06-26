FILE_DIR=$(dirname `realpath $0`)

# Create personal dirs

## ~/.local
if [ ! -d ~/.local ]; then
    echo Create '~/.local' dir
    mkdir ~/.local
    cd ~/.local
    mkdir bash-completion bin lib share
    cd -
fi

## ~/workspace
if [ ! -d ~/workspace ]; then
    echo Create '~/workspace' dir
    mkdir ~/workspace
fi

# For terminal emulator
${FILE_DIR}/terminal/setup.sh