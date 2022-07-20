<h1 align="center"><i>~/.dotfiles</i></h1>

![Screenshot](https://user-images.githubusercontent.com/70562711/173168308-aa33e90d-bf1a-4031-b462-553ca70d3d10.png)

## A few programs that I use

- Window Manager: [dwm](https://dwm.suckless.org/)
- Terminal: [st](https://st.suckless.org/)
- Shell: [zsh](https://www.zsh.org/)
- Text Editor: [Neovim](https://github.com/neovim/neovim)
- Status Bar: [dwmblocks-async](https://github.com/UtkarshVerma/dwmblocks-async)
- AUR Helper: [Pikaur](https://github.com/actionless/pikaur)
- Image Viewer: [sxiv](https://github.com/muennich/sxiv)
- Screenshot: [maim](https://github.com/naelstrof/maim)
- Display Server: [Xorg](https://www.x.org/wiki)
- Compositor: [Picom](https://github.com/dccsillag/picom)

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
<summary><b>Dependencies</b></summary><br>

- rsync (for the above command ig)
- xorg (Display server)
- xrdb (for themes)
- i3lock-color (lockscreen)
- nitrogen (setting wallpaper)
- pamixer (I use this to control volume)
- maim (screenshot tool)
- dunst (notification daemon)
- libnotify (for dunstify command?)
- brightnessctl (control screen brightness)
- noto-fonts-cjk (For CJK font)
- nerd-fonts-jetbrains-mono (The main font that is everywhere in my build)
- rofi (app launcher)
- jgmenu (X11 menu to launch apps)
- [My dwm build](https://github.com/samisthefbi/dwm) (window manager)
- [My dmenu build](https://github.com/samisthefbi/dmenu) (dynamic menu)
- [My st build](https://github.com/samisthefbi/st) (because Alacritty has diminished p10k glyphs & idk how to fix that)
- [My dwmblocks-async config](https://github.com/samisthefbi/dwmblocks-async) (clickable dwm bar)
- picom-animations-git (Compositor for those fancy transparency) 
- awk (utility to extract and present information) (I use this for scripts)
- [eww](https://github.com/elkowar/eww) (for battery percentage and currently playing song in lockscreen)
- ffmpeg (audio/video converter) (used to extract album art in a script)
- xdotool (X11 automation tool) (used in theme changer script)
- yt-dlp (YouTube downloader) (used in YouTube downloader script)
- paplay (for notification sound)
- mpv (for watchmedia script)
- xclip (for copying/pasting)
- colorpicker
- mpc (for managing mpd)
- mpd (music daemon)
- ncmpcpp (mpd client)
- python-pywal (for automated themes using setwal script)
- imagemagick (for making lockscreen background)
- jq (for booru script)
- curl (same as above)
- wget (same as above)
- sed (same usage as awk)
- nvim (my preferred text editor)
- redshift (change color temperature of display)

</details>

## To-do

- [x] ~~Apply Xresources/xrdb+live reloading patch to st, dwm and dmenu~~
	- [x] ~~Make setwal script that uses pywal+Xresources to save colors~~
	- [x] ~~Make theme changer script that uses Xresources to save/restore colorscheme & wallpaper~~
- [X] ~~Add colors to status bar elements~~
	- [X] ~~Use Status2d+xrdb instead of statuscolors~~
- [X] ~~Clickable dwmblocks~~ 
    - [X] ~~Rewrite status bar scripts & probably others as well~~
- [ ] Make some themes
	- [X] ~~Nord Theme~~
	- [X] ~~Gruvbox Theme~~
    - [ ] Catpuccin Theme
	- [ ] Evangelion theme?
    - [ ] Get GTK themes for respective colorscheme
- [ ] Remove unnecessary stuff

## Wallpaper Credits

[Link to the wallpaper in the screenshot above.](https://nordthemewallpapers.com/Backgrounds/16-9/All/img/3mcg97oyotu61.jpg)

## Troubleshooting

<details>
<summary><b>No WiFi after opening a closed laptop lid</b></summary><br>

This happens because opening a closed laptop lid somehow triggers an event to softblock wifi. Weird thing with the kernel apparently.

A simple workaround for this is to edit `/etc/systemd/logind.conf`, uncomment every `HandleLidSwitch` line and put `ignore` as their value (doing this so that system doesn't suspend/sleep). Then, install `acpid` package and head over to `/etc/acpi/`. Open `handler.sh` (may need to use sudo/doas) and find the line containing `button/lid`. In the `open` case add a new line `/usr/bin/rfkill unblock wifi`. Now enable and start acpid with `sudo systemctl enable --now acpid.service && sudo systemctl start --now acpid.service`
</details>

<details>
<summary><b>Brightness set to maximum when plugging/unplugging charger</b></summary><br>

To fix this, 

```
sudo systemctl stop systemd-backlight@backlight:acpi_video1.service
sudo systemctl disable systemd-backlight@backlight:acpi_video1.service
```
</details>
