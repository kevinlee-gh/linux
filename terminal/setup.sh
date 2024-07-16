FILE_DIR=$(dirname `realpath $0`)

echo "Setup terminal:"
# Get personal bashrc
echo "  + '~/.bashrc':"

echo "    * Personal Customizations"
### remove old personal bashrc
sed -i '/^# >>> PERSONAL CUSTOMIZATIONS$/,/^# <<< PERSONAL CUSTOMIZATIONS$/d' ~/.bashrc

### add new personal bashrc
echo "" >> ~/.bashrc
echo "# >>> PERSONAL CUSTOMIZATIONS" >> ~/.bashrc
cat "${FILE_DIR}/utils/.bashrc" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "# <<< PERSONAL CUSTOMIZATIONS" >> ~/.bashrc

echo "    * ~/.bash_aliases"
if [ -f ~/.bash_aliases ]; then rm -rf ~/.bash_aliases; fi
ln -s ${FILE_DIR}/utils/.bash_aliases ~/.bash_aliases

echo "  + Terminal emulator configs"
# Add configs to ../home/.config dir
for CONFIG_DIRNAME in $(ls ${FILE_DIR}/config); do
    SOURCE_DIR=${FILE_DIR}/config/${CONFIG_DIRNAME}
    DESTINATION_DIR=${FILE_DIR}/../home/.config/${CONFIG_DIRNAME}
    if [ -L ${DESTINATION_DIR} ]; then 
        rm ${DESTINATION_DIR}
    fi

    ln -s ${SOURCE_DIR} ${DESTINATION_DIR}
done