FILE_DIR=$(dirname `realpath $0`)

echo "Setup terminal emulator:"

# Add env file
ln -sf ${FILE_DIR}/utils/.env ~/.local/.env

# Get personal bins
echo "  + Get custom bin files"
for BIN_NAME in $(ls ${FILE_DIR}/bin); do
    BIN_FILE="${FILE_DIR}/bin/${BIN_NAME}"
    ln -sf "${BIN_FILE}" ~/.local/bin
done

# Get personal bashrc
echo "  + Add '~/.bashrc'"
### remove old personal bashrc
sed -i '/^# >>> PERSONAL PATH$/,/^# <<< PERSONAL PATH$/d' ~/.bashrc

### add new personal bashrc
echo "" >> ~/.bashrc
echo "# >>> PERSONAL PATH" >> ~/.bashrc
cat "${FILE_DIR}/utils/.bashrc" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "# <<< PERSONAL PATH" >> ~/.bashrc

# Add configs
echo "  + Add '~/.config':"

for CONFIG_DIRNAME in $(ls ${FILE_DIR}/config); do
    echo "    * ${CONFIG_DIRNAME}"

    SOURCE_DIR=${FILE_DIR}/config/${CONFIG_DIRNAME}
    DESTINATION_DIR=~/.config/${CONFIG_DIRNAME}
    if [ -L ${DESTINATION_DIR} ]; then 
        rm ${DESTINATION_DIR}
    elif [ -d ${DESTINATION_DIR} ]; then
        echo "WARN: '${DESTINATION_DIR}' is existing as a dir. Save a backup at ${DESTINATION_DIR}.bak"
        mv ${DESTINATION_DIR} ${DESTINATION_DIR}.bak
    fi

    ln -s ${SOURCE_DIR} ${DESTINATION_DIR}

done

# Activate guake config
guake --restore-preferences ~/.config/guake/custom.cfg