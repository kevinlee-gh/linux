FILE_DIR=$(dirname `realpath $0`)

# Add config to ~/.config
echo "Add '~/.config':"
for CONFIG_DIRNAME in $(ls ${FILE_DIR}/.config); do
    echo "  + ${CONFIG_DIRNAME}"

    SOURCE_DIR=${FILE_DIR}/.config/${CONFIG_DIRNAME}
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