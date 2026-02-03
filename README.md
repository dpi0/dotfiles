# `~/.dotfiles`

Install

```bash
stow .
```

`./ly`: Stow manually `sudo stow -t / ly`

## Bat

<https://github.com/sharkdp/bat#adding-new-themes>

<https://github.com/rebelot/kanagawa.nvim/issues/213#issuecomment-1987536469>

Run this once to load the custom `.tmTheme`

```bash
bat cache --build

bat --list-themes | fzf --preview="bat --theme={} --color=always ~/projects/lrcget_bash/lrcget_bash.sh"
```

## Yazi

On a fresh machine, install all packages in `package.toml`

```bash
ya pkg install
```

## ly

Disable your previous login manager

```bash
sudo systemctl disable PREVIOUS_MANAGER.service
sudo systemctl enable ly
```

## Batsignal

```bash
systemctl --user daemon-reload
systemctl --user enable --now batsignal.service
systemctl --user status batsignal.service
```

To send a notification via external script

```bash
ExecStart=batsignal -c 20 -w 28 -f 95 -p -e \
   -M "/path/to/script/notify.sh '%%s' '%%s'"
```

- `-c 5` critical level 5%
- `-w 20` warning level 20%
- `-f 95` full level 95%
- `-p` notify when plugged/unplugged
- `-e` notifications expire and go away
- `-M` trigger a command

## mpv

<https://github.com/tomasklaen/uosc/releases/latest/download/uosc.zip>

<https://github.com/tomasklaen/uosc/releases/latest/download/uosc.conf>

Using [uosc](https://github.com/tomasklaen/uosc) as the On Screen Controller.

Extract `uosc.zip`, place `uosc/scripts/uosc` in `~/.config/mpv/scripts` and `uosc/fonts` in `~/.config/mpv/fonts`.

Download `uosc.conf` and place in `~/.config/mpv/script-opts`.

Using [thumbfast](https://github.com/po5/thumbfast) for thumbnails on seek.

Managing aspect ratio and crop (like VLC), using [kism/mpvscripts](https://github.com/kism/mpvscripts/tree/main/scripts) (modified a bit).

Custom script in `~/.config/mpv/scripts/custom/force-16-by-9.lua` forces 16x9 aspect ratio on launch.

```bash
$ tree -a -I ".git" -L 3 .config/mpv

.config/mpv
├── fonts
│   ├── uosc_icons.otf
│   └── uosc_textures.ttf
├── input.conf
├── mpv.conf
├── mpv_windows.conf
├── script-opts
│   └── uosc.conf
└── scripts
    ├── aspect-ratio-vlc.lua
    ├── crop-vlc.lua
    ├── custom
    │   └── force-16-by-9.lua
    ├── thumbfast.lua
    └── uosc
        ├── bin
        ├── char-conv
        ├── elements
        ├── intl
        ├── lib
        └── main.lua

11 directories, 11 files
```

### Windows

Use [scoop](https://scoop.sh) to install mpv `scoop install extras/mpv`.

Installation files will be in `%USERPROFILE%\scoop\apps\mpv\current`.

Clone

```powershell
git clone "https://github.com/dpi0/dotfiles" "$env:USERPROFILE\Downloads"
```

Grab `$env:USERPROFILE\Downloads\dotfiles\.config\mpv` directory and place in `$env:USERPROFILE\scoop\apps\mpv\current\portable_config`.

Rename `./mpv_windows.conf` to `./mpv.conf`.
