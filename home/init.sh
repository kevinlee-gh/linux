FILE_DIR=$(dirname `realpath $0`)

echo "Init '~' customizations:"


echo "  + '~/.local':"

# Create ~/.local
echo "    * Create '~/.local' dir"
mkdir -p ~/.local

echo "    * 'bash-completion'"
cd ~/.local
mkdir -p bash-completion/completions bin
cd - > /dev/null

echo "    * 'bin'"
# SymLinks
ln -sf ${FILE_DIR}/.local/bin/* ~/.local/bin

echo "    * 'envs'"
if [ -d ~/.local/envs ]; then rm -rf ~/.local/envs; fi
ln -sf ${FILE_DIR}/.local/envs ~/.local/envs

## ~/workspace
if [ ! -d ~/workspace ]; then
    echo "  + Create'~/workspace'"
    mkdir ~/workspace
fi