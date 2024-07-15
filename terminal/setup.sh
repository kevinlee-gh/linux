FILE_DIR=$(dirname `realpath $0`)

# Get personal bashrc
echo "Add '~/.bashrc'"
### remove old personal bashrc
sed -i '/^# >>> PERSONAL PATH$/,/^# <<< PERSONAL PATH$/d' ~/.bashrc

### add new personal bashrc
echo "" >> ~/.bashrc
echo "# >>> PERSONAL PATH" >> ~/.bashrc
cat "${FILE_DIR}/utils/.bashrc" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "# <<< PERSONAL PATH" >> ~/.bashrc

# Add configs to ../home/.config dir
for CONFIG_DIRNAME in $(ls ${FILE_DIR}/config); do
    SOURCE_DIR=${FILE_DIR}/config/${CONFIG_DIRNAME}
    DESTINATION_DIR=${FILE_DIR}/../home/.config/${CONFIG_DIRNAME}
    if [ -L ${DESTINATION_DIR} ]; then 
        rm ${DESTINATION_DIR}
    fi

    ln -s ${SOURCE_DIR} ${DESTINATION_DIR}
done