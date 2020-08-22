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
fi
source ~/.bashrc

chmod +x runcpp.sh
cp runcpp.sh ~/.local/bin/runcpp

echo "Done!"
echo "Restart the terminal for changes to take effect."
echo "Then, try the command runcpp."
