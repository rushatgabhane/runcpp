#!/bin/bash

if [ ! -d ~/.local ]; then
	mkdir ~/.local
fi

if [ ! -d ~/.local/bin ]; then
	mkdir ~/.local/bin
fi

if ! grep 'PATH=.*HOME/.local/bin' ~/.bashrc
then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
fi

if ! grep 'PATH=.*HOME/.local/bin' ~/.zshrc
then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc
fi


chmod +x runcpp.sh
cp runcpp.sh ~/.local/bin/runcpp

echo "Done! Restart the terminal for changes to take effect."
echo "Usage: runcpp <file.cpp>"
