FILE_DIR=$(dirname `realpath $0`)

# Create personal dirs

## ~/.local
echo Create '~/.local' dir
mkdir -p ~/.local
cd ~/.local
mkdir -p bash-completion bin lib share
cd -

## ~/workspace
if [ ! -d ~/workspace ]; then
    echo Create '~/workspace' dir
    mkdir ~/workspace
fi

# For terminal emulator
${FILE_DIR}/terminal/setup.sh