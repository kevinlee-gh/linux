if [ ! -d ~/.local ]; then
    mkdir -p ~/.local
    cd ~/.local
    mkdir -p bash-completion bin lib share
    cd -
fi

# Get personal bins
./terminal/link_bin.sh

# Get personal bashrc
sed -i '/^# >>> PERSONAL PATH$/,/^# <<< PERSONAL PATH$/d' ~/.bashrc

echo "" >> ~/.bashrc
echo "# >>> PERSONAL PATH" >> ~/.bashrc
cat ./terminal/.bashrc >> ~/.bashrc
echo "" >> ~/.bashrc
echo "# <<< PERSONAL PATH" >> ~/.bashrc