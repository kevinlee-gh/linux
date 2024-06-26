FILE_DIR=$(dirname `realpath $0`)

# Create ~/.local dir
if [ ! -d ~/.local ]; then
    echo Create '~/.local' dir
    mkdir ~/.local
    cd ~/.local
    mkdir bash-completion bin lib share
    cd -
fi

# For terminal emulator
${FILE_DIR}/terminal/setup.sh