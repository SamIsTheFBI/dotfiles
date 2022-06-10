<h1 align="center"><i>~/.dotfiles</i></h1>

![Screenshot](https://0x0.st/oMDJ.png)

## A few programs that I use

- Window Manager: [dwm](https://dwm.suckless.org/)
- Terminal: [st](https://st.suckless.org/)
- Shell: [zsh](https://www.zsh.org/)
- Text Editor: [Neovim](https://github.com/neovim/neovim)
- Status Bar: [slstatus](https://tools.suckless.org/slstatus/)
- AUR Helper: [Pikaur](https://github.com/actionless/pikaur)
- Image Viewer: [sxiv](https://github.com/muennich/sxiv)
- Screenshot: [maim](https://github.com/naelstrof/maim)
- Display Server: [Xorg](https://www.x.org/wiki)
- Compositor: [Picom](https://github.com/yshui/picom)

I also make use of [eww widgets](https://github.com/elkowar/eww) to display battery percentage and current song in the lockscreen.

## Setup (Arch)

If you don't have Arch installed and want to use my setup, then try [my install script](https://github.com/SamIsTheFBI/sami). Installing Arch yourself, getting the dependencies and then cloning my dotfiles is always an alternative that I would suggest.

If you already have Arch installed, figure out dependencies from below, install them & run the following:

```
git clone --separate-git-dir=$HOME/.dotfiles https://github.com/SamIsTheFBI/dotfiles.git tmpdotfiles
rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/
rm -r tmpdotfiles
```

<details>
<summary><b>Minimal</b></summary><br>
  
With just these, a few not-so-important scripts won't work. Lockscreen won't show battery percentage. You will have to set up keybindings yourself. You'd have to live with the same theme forever (unless you try to change codes which is tedious). But on the bright side, you get a minimal Arch setup & you configure most things so it's more your setup and less mine.
  
- rsync
- xorg
- i3lock-color
- nitrogen
- pamixer
- maim
- dunst
- libnotify
- brightnessctl
- nerd-fonts-jetbrains-mono
- slstatus
- dwm
- dmenu
- rofi
</details>

<details>
<summary><b>Recommended</b></summary><br>

All my scripts should work fine. Changing/saving themes should be a breeze. This will give my complete setup minus the apps.
   
- rsync
- xorg
- xrdb
- i3lock-color
- nitrogen
- pamixer
- maim
- dunst
- libnotify
- brightnessctl
- noto-fonts-cjk
- nerd-fonts-jetbrains-mono
- rofi
- [My dwm build](https://github.com/samisthefbi/dwm)
- [My dmenu build](https://github.com/samisthefbi/dmenu)
- [My st build](https://github.com/samisthefbi/st) (because Alacritty has diminished p10k glyphs)
- [My slstatus configs](https://github.com/samisthefbi/slstatus) (using a single script to display status bar elements sometimes doesn't update on my ultra poor laptop)
- picom
- awk
- [eww](https://github.com/elkowar/eww)
- ffmpeg
- xdotool
- yt-dlp
- paplay
- mpv
- xclip
- colorpicker
- mpc
- mpd
- ncmpcpp
- python-pywal
- imagemagick
- jq
- curl
- wget
- sed
- nvim
- redshift

</details>

## To-do

- [x] ~~Apply Xresources/xrdb+live reloading patch to st, dwm and dmenu~~
	- [x] ~~Make setwal script that uses pywal+Xresources to save colors~~
	- [x] ~~Make theme changer script that uses Xresources to save/restore colorscheme & wallpaper~~
- [X] ~~Add colors to status bar elements~~
	- [X] ~~Use Status2d+xrdb instead of statuscolors~~
- [ ] Make some themes (atleast 2)
	- [X] ~~Nord Theme~~
	- [ ] Gruvbox Theme
	- [ ] Evangelion theme?
- [ ] Customize the tags side of the vanilla dwm status bar
- [ ] Clickable dwmblocks

## Wallpaper Credits

The wallpaper used is drawn by [Muji](https://www.pixiv.net/artworks/91389488).

## Troubleshooting

<details>
<summary><b>No WiFi after opening a closed laptop lid</b></summary><br>

This happens because opening a closed laptop lid somehow triggers an event to softblock wifi. Weird thing with the kernel apparently.

A simple workaround for this is to edit `/etc/systemd/logind.conf`, uncomment every `HandleLidSwitch` line and put `ignore` as their value (doing this so that system doesn't suspend/sleep). Then, install `acpid` package and head over to `/etc/acpi/`. Open `handler.sh` (may need to use sudo/doas) and find the line containing `button/lid`. In the `open` case add a new line `/usr/bin/rfkill unblock wifi`. Now enable and start acpid with `sudo systemctl enable --now acpid.service && sudo systemctl start --now acpid.service`
</details>

<details>
<summary><b>Brightness set to maximum when plugging/unplugging charger</b></summary>

To fix this, 

```
sudo systemctl stop systemd-backlight@backlight:acpi_video1.service
sudo systemctl disable systemd-backlight@backlight:acpi_video1.service
```
</details>
