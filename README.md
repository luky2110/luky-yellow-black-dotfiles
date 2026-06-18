# Luky's Yellow-Black Dotfiles

These are my hyprland dots.
If you do not like them, change or do not use them.

Arch
```
sudo pacman -S git qt5ct qt6ct qt5-wayland qt6-wayland nwg-look hyprland xdg-desktop-portal-hyprland hyprpaper alacritty wofi waybar thunar thunar-volman gvfs udisks2 pavucontrol ttf-jetbrains-mono-nerd hyprpolkitagent grimshot hyprcursor hyprshutdown
```
```
systemctl --user enable --now hyprpolkitagent.service
```
# Installation

This installs all dependencies and applies the dotfiles
Make sure you have git installed

```
cd ~/
git clone https://github.com/luky2110/luky-purple-hyprland-dots.git
cd luky-purple-hyprland-dots
chmod +x installer.sh
./installer.sh
hyprshutdown
```
# Recommended Programs:

Arch
```
sudo pacman -S loupe vlc mpv mpv-mpris file-roller 
```

# Examples

<img src="https://github.com/luky2110/luky-purple-hyprland-dots/blob/main/example1.png" alt="example1">

<img src="https://github.com/luky2110/luky-purple-hyprland-dots/blob/main/example2.png" alt="example2">
