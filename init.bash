if [ ! -d ~/.local ]; then
    mkdir -p ~/.local
    cd ~/.local
    mkdir -p bash-completion bin lib share
    cd -
fi

# Get personal bins
./terminal/link_bin.sh

# Get personal bashrc