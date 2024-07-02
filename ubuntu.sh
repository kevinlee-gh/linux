sudo apt update && sudo apt upgrade
sudo apt install git vim golang-go snapd curl fio bash-completion guake gnome-terminal cargo

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

cargo install --locked zellij

ssh-keygen -t rsa -C "kienlt"
