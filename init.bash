FILE_DIR=$(dirname $0)

if [ ! -d ~/.local ]; then
    mkdir -p ~/.local
    cd ~/.local
    mkdir -p bash-completion bin lib share
    cd -
fi

# Get personal bins
for BIN_NAME in $(ls ${FILE_DIR}/terminal/bin); do
    BIN_FILE_DIR=$(realpath "${FILE_DIR}/terminal/bin/${BIN_NAME}" | xargs dirname)
    BIN_FILE="${BIN_FILE_DIR}/${BIN_NAME}"
    ln -sf "${BIN_FILE}" ~/.local/bin
done

# Get personal bashrc

### remove old personal bashrc
sed -i '/^# >>> PERSONAL PATH$/,/^# <<< PERSONAL PATH$/d' ~/.bashrc

### add new personal bashrc
echo "" >> ~/.bashrc
echo "# >>> PERSONAL PATH" >> ~/.bashrc
cat ./terminal/.bashrc >> ~/.bashrc
echo "" >> ~/.bashrc
echo "# <<< PERSONAL PATH" >> ~/.bashrc

