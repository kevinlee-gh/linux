#!/bin/bash
FILE_DIR=$(dirname `realpath $0`)

# sudo sed -i 's/^#.*WaylandEnable=.*/WaylandEnable=false/' /etc/gdm3/custom.conf
gsettings set org.gnome.desktop.background picture-uri file://${FILE_DIR}/image/background.jpg
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
gsettings set org.gnome.desktop.interface monospace-font-name '0xProto Nerd Font Mono 11'

(   # System Keybindings
    gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Primary>space']"
    gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Primary><Shift>space']"
)

( # custom Keybindings
    GNOME_SCHEMA="org.gnome.settings-daemon.plugins.media-keys"
    GNOME_KEY="custom-keybindings"

    CONFIG_DOT="${GNOME_SCHEMA}.custom-keybinding"
    CONFIG_PATH="/$(echo $GNOME_SCHEMA | sed 's/\./\//g')/${GNOME_KEY}"

    LS_KEYBINDINGS=(
        'Guake Toggle:guake-toggle:F1'
    )

    ( # Define list custom shortcuts
        custom_keybindings_list_value=""
        
        for i in "${!LS_KEYBINDINGS[@]}"; do 
            custom_keybindings_list_value="${custom_keybindings_list_value},'${CONFIG_PATH}/custom${i}/'"
        done
        custom_keybindings_list_value="[${custom_keybindings_list_value[@]:1}]"

        gsettings set ${GNOME_SCHEMA} ${GNOME_KEY} "$custom_keybindings_list_value"
    )
    
    ( # Set detail
        for i in "${!LS_KEYBINDINGS[@]}"; do 
            IFS=':' read -ra keybinding <<< "${LS_KEYBINDINGS[$i]}"

            gsettings set "${CONFIG_DOT}:${CONFIG_PATH}/custom${i}/" name "${keybinding[0]}"
            gsettings set "${CONFIG_DOT}:${CONFIG_PATH}/custom${i}/" command "${keybinding[1]}"
            gsettings set "${CONFIG_DOT}:${CONFIG_PATH}/custom${i}/" binding "${keybinding[2]}"
        done
    )

)