## My Arch Setup
![Screenshots of my setup without eww widget](https://0x0.st/omWx.png)

## Things to do:

- [] Make a better status bar (change active tag style, add colors, clickable)
- [] Add xrdb patch and figure how to use it 
- [] Create different themes ig (gruvbox, onedark and stuff how hard can it be?)
- [] Write explanations for stuff (keymappings, scripts)
- [] Find a good enough reason to use Firefox and then pywalfox

## A few programs I use

- Terminal: [st](https://st.suckless.org/)
- Shell: [ZSH](https://www.zsh.org/)
- Text Editor: [Neovim](https://github.com/neovim/neovim)
- Status Bar: [slstatus](https://tools.suckless.org/slstatus/)
- AUR Helper: [Pikaur](https://github.com/actionless/pikaur)
- Font: [Nerd Fonts JetBrains Mono](https://www.nerdfonts.com/)
- Image Viewer: [sxiv](https://github.com/muennich/sxiv)
- Screenshot: [maim](https://github.com/naelstrof/maim)
- Display Server: [Xorg](https://www.x.org/wiki)
- Compositor: [Picom](https://github.com/yshui/picom)

I also make use of [eww widgets](https://github.com/elkowar/eww) to display battery percentage and current song in the lockscreen.

## Setup (Arch)

If you already have Arch installed, figure out requirements & run Part 3 from [my Arch install script](https://github.com/samisthefbi/sami). It clones my dotfiles, dwm, slstatus and st configs. 

If you don't have Arch installed, well, use my install script completely.

## Scripts

Here is a brief explanation of some of the scripts that I often use. These and many more can be found in `~/.local/bin/`.

- battery: Fetches battery capacity. There's different icons to display when charging or not.
- booru: A script to download images from various anime imageboards (booru == board, get it?). Currently it can fetch from Danbooru, Safebooru, Yandere & Konachan. I use these for downloading images from a 'pool' (collection of images) but modify the code a bit and you can download videos as well.
- colpick: This script uses `colorpicker` to pick colors from screen while displaying a preview in the bottom left corner of the screen and saves that color's hex code to clipboard. Also displays a notification of the selected color code.
- dependcheck: I use this script check for and install dependencies when I am building something from source code. Type in the package name and it displays if it is available or not. If not, it then continues to download & install it.

## Troubleshooting

- No WiFi after closing laptop lid

For laptop users, add the following to `/etc/systemd/logind.conf` if you face wifi turning off after closing laptop lid:

```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```
and make a file `/etc/NetworkManager/conf.d` with this:
```
[connection]
wifi.powersave = 2
```
After this, restart NetworkManager with `sudo systemctl restart NetworkManager.service`. Once that is done, lose every open terminal and then press `Win+F5` which will bring us back to TTY. Not closing terminals would corrupt .zsh_history file, which kinda sucks because then you can't run DWM.

Now for the final step, type this:
```
sudo systemctl restart network-manager.service
```

Now `startx` to go back to dwm.
