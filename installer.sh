#!/bin/bash
cd ~/
mkdir dotfile-backup
mv .config/alacritty dotfile-backup
mv .config/hypr dotfile-backup
mv .config/waybar dotfile-backup
mv .config/wofi dotfile-backup
cd luky-yellow-black-dotfiles
mv alacritty hypr waybar wofi ~/.config
cd
rm -rf luky-yellow-black-dotfiles
chmod +x installer.sh ~/.config/waybar/power.sh
echo "Luky's Dotfiles were successfully installed"
