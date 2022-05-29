## My Arch Setup
![Screenshot](https://0x0.st/oaVw.png)

## A few programs that I use

- Window Manager: [dwm](https://dwm.suckless.org/)
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

<details>
<summary><b>No WiFi after opening a closed laptop lid</b></summary>

This happens because closing lid somehow triggers an event to softblock wifi. Weird thing with the kernel apparently.

A simple workaround for this is to edit `/etc/systemd/logind.conf`, uncomment every `HandleLidSwitch` line and put `ignore` as their value (doing this so that system doesn't suspend/sleep). Then, install `acpid` package and head over to `/etc/acpi/`. Open `handler.sh` (may need to use sudo/doas) and find the line containing `button/lid`. In the `open` case add a new line `/usr/bin/rfkill unblock wifi`. Now enable and start acpid with `sudo systemctl enable --now acpid.service && sudo systemctl start --now acpid.service`
</details>
