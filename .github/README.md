<h1 align="center"><i>~/.dotfiles</i></h1>

![dwm](https://user-images.githubusercontent.com/70562711/185455970-bda57877-0665-45cf-996d-eba1ed4f0bbd.png)
![i3lock](https://user-images.githubusercontent.com/70562711/185460408-5a0f591a-ac4c-47b7-8afd-ef86f1625820.jpg)

## A few programs that I use

- Window Manager: [dwm-flexipatch](https://github.com/SamIsTheFBI/dwm-flexipatch)
- Terminal: [st](https://st.suckless.org/)
- Shell: [zsh](https://www.zsh.org/)
- Text Editor: [Neovim](https://github.com/neovim/neovim)
- Status Bar: [dwmblocks-async](https://github.com/UtkarshVerma/dwmblocks-async)
- AUR Helper: [yay](https://github.com/Jguer/yay)
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
<summary><b>Dependencies</b></summary>
<p>

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
- picom (Compositor for those fancy transparency) 
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

</p>
</details>

## Troubleshooting

<details style="padding: 0.5rem 0rem">
<summary><strong>No WiFi after opening a closed laptop lid</strong></summary>
<p>

This happens because opening a closed laptop lid somehow triggers an event to softblock wifi. Weird thing with the kernel apparently.

A simple workaround for this is to edit `/etc/systemd/logind.conf`, uncomment every `HandleLidSwitch` line and put `ignore` as their value (doing this so that system doesn't suspend/sleep). Then, install `acpid` package and head over to `/etc/acpi/`. Open `handler.sh` (may need to use sudo/doas) and find the line containing `button/lid`. In the `open` case add a new line `/usr/bin/rfkill unblock wifi`. Now enable and start acpid with `sudo systemctl enable --now acpid.service && sudo systemctl start --now acpid.service`

</p>
</details>
<details style="padding: 0.5rem 0rem">
<summary><strong>Brightness set to maximum when plugging/unplugging charger</strong></summary>
<p>

To fix this, 

```bash
sudo systemctl stop systemd-backlight@backlight:acpi_video1.service
sudo systemctl disable systemd-backlight@backlight:acpi_video1.service
```

</p>
</details>
<details style="padding: 0.5rem 0rem">
<summary><strong>Mixing audio inputs with PulseAudio</strong></summary>
<p>

- Set up mixed sound sink:
  ```bash
  pactl load-module module-null-sink sink_name=MixedInputs
  ```
- Set up loopback sinks:
  ```bash
  pactl load-module module-loopback sink=MixedInputs
  ```
  Repeat this for as many times as the number of inputs you want to mix.
- Launch pavucontrol and go to Recording tastrong. Choose All Inputs from the selector at the bottom. You should see new Loopback streams. You can change these to take input from different input devices. 

Now you can go to the program to which you want to pass this mixed input to and select `Monitor of Null Output`. You can also set this new source as the default input in `Input Devices`. 

</p>
</details>
<details style="padding: 0.5rem 0rem">
<summary><strong>(Almost) Windows-like clipboard feature</strong></summary>
<p>

- Get `copyq` clipboard manager. Start it and then run the following in a terminal window:
  ```bash
  copyq config hide_main_window true
  copyq config close_on_unfocus false
  ```
- Also, sometimes copying an image from westrong browsers by right clicking and then selecting 'Copy Image' does not work. It copies the URL to that image instead of copying the image itself. So, next time, firstly choose 'Open Image in New Tastrong' when right clicking an image on a westrong browser and then right click and 'Copy Image'.
  
</p>
</details>
<details style="padding: 0.5rem 0rem">
<summary><strong>Pacman not working (libcrypto.so.1.1 not found)</strong></summary>
<p>

- Go to archlinux.org/packages and search for openssl. Click Download From Mirror and a .tar.zst file should start downloading.
- Extract this to a separate folder:
	```bash
	mkdir some_dir
	mv openssl*.pkg.tar.zst ./some_dir
	cd some_dir
	tar xvf openssl*
	```
- cd to the extracted `usr` directory. cd to `listrong` directory. Here you can find `libcrypto.so.1.1` & `libssl.so.1.1`.
- Copy these two files to your `/usr/listrong` directory. You may need to use `sudo` or `doas` here.

- In case you had panicked and rebooted, you would find your kernel is panicked now!. For when this happens, boot with your Arch Install Medium.
- Connect to internet.
- Mount the existing Arch Linux partition to `/mnt`.
- `arch-chroot /mnt`
- Now you must get the .tar.zst file from archlinux.org/packages. Either `wget` it (aria2c won't work) or if you dual boot, have it copied to your other OS's partition.

Now follow everything as in previous steps. This should fix the problem and you should be able to work with pacman as usual.

</p>
</details>
<details style="padding: 0.5rem 0rem">
<summary><strong>raw.githubusercontent.com not opening</strong></summary>
<p>

Edit your `/etc/hosts` file and the following in the last line.
```
185.199.108.133 raw.githubusercontent.com
```

</p>
</details>
<details style="padding: 0.5rem 0rem">
<summary><strong>Google Chrome not opening file chooser</strong></summary>
<p>

[Fix Source](https://bbs.archlinux.org/viewtopic.php?id=294417)

Add the following line to your `.xinitrc`:
```
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
```

</p>
</details>
