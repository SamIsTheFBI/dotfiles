## My Arch Setup
![Screenshot](https://0x0.st/oaVw.png)

## A few programs I use

- Terminal: [st](https://st.suckless.org/)
- Shell: [zsh](https://www.zsh.org/)
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

## Wallpaper Credits

The wallpaper used is drawn by [Muji](https://www.pixiv.net/artworks/91389488).

## Troubleshooting

- No WiFi after closing laptop lid

For laptop users, add the following to `/etc/systemd/logind.conf` if you face wifi turning off after closing laptop lid:

```
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
HandleLidSwitchDocked=ignore
```
and make a file `/etc/NetworkManager/conf.d/default-wifi-powersave-on.conf` with these lines in it:
```
[connection]
wifi.powersave = 2
```
After this, restart NetworkManager with `sudo systemctl restart NetworkManager.service`. Once that is done, lose every open terminal and then press `Win+F5` which will bring us back to TTY. Not closing terminals would corrupt `.zsh_history` file, which kinda sucks because then you can't run DWM.

Now for the final step, type this:
```
sudo systemctl restart network-manager.service
```

Now `startx` to go back to dwm.
