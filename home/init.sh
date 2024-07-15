FILE_DIR=$(dirname `realpath $0`)

# Create ~/.local
echo Create '~/.local' dir
mkdir -p ~/.local
cd ~/.local
mkdir -p bash-completion/completions bin
cd -

# SymLinks
ln -sf ${FILE_DIR}/.local/bin/* ~/.local/bin

if [ -d ~/.local/envs ]; then rm -rf ~/.local/envs; fi
ln -sf ${FILE_DIR}/.local/envs ~/.local/envs

## ~/workspace
if [ ! -d ~/workspace ]; then
    echo Create '~/workspace' dir
    mkdir ~/workspace
fi