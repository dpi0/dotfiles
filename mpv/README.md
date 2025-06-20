# `mpv` configuration

- `./mpv.conf` controls the mpv's main configurations (see the default file at `/usr/share/doc/mpv/mpv.conf`)
- `./input.conf` controls the keybinds (i've disabled all default keybinds in the mpv.conf) (default file at `/usr/share/doc/mpv/input.conf`)

list of user scripts for mpv: <https://github.com/mpv-player/mpv/wiki/User-Scripts>

awesome mpv: <https://github.com/stax76/awesome-mpv>

inspiration: <https://github.com/Zabooby/mpv-config>

## osc (on screen controller)

- when `osc=no` then NO ui elements will be present on screen. `osc=yes` shows default mpv's osc.
- you can have custom 3rd party osc like
  - [uosc](https://github.com/tomasklaen/uosc) - micro osc
  - [mpv-osc](https://github.com/maoiscat/mpv-osc-modern)
  - [ModernX](https://github.com/zydezu/ModernX)
- i'm using uosc for now. install by following it's manual [install process](https://github.com/tomasklaen/uosc#manual)
- basically download latest [uosc.zip](https://github.com/tomasklaen/uosc/releases/latest/download/uosc.zip)
- move the `scripts` and `fonts` dir to `~/.config/mpv`
- then download the [uosc.conf](https://github.com/tomasklaen/uosc/releases/latest/download/uosc.conf) file
- and create a new dir `~/.config/mpv/script-opts` and place `uosc.conf` under it
- `script-opts` dir contains the configurable options for the items in the `scripts` dir

### thumbfast

<https://github.com/po5/thumbfast>

- provides seekbar thumbnails
- download the `thumbfast.lua` and `thumbfast.conf` from <https://github.com/po5/thumbfast>
- place them in `~/.config/mpv/scripts/thumbfast.lua` and `~/.config/mpv/script-opts/thumbfast.conf`
- where again the 'plugin' or script is the .lua file
- and the configuration options for the 'plugin' are in `script-opts` dir in `thumbfast.conf`
- thumbfast supports [these](https://github.com/po5/thumbfast#ui-support) oscs by default

### memo

<https://github.com/po5/memo>

- recent files menu, saves your watch history, and displays it in a nice menu
- save [memo.lua](https://github.com/po5/memo/blob/master/memo.lua) in `./scripts`
- and [memo.conf](https://github.com/po5/memo/blob/master/memo.conf) in `./script-opts`
- list of keybinds/commands are in <https://github.com/po5/memo/blob/master/README.md#custom-keybinds>

### solo scripts

- <https://github.com/mfcc64/mpv-scripts/blob/master/visualizer.lua>
- <https://github.com/Eisa01/mpv-scripts/blob/master/scripts/SmartSkip.lua> and <https://github.com/Eisa01/mpv-scripts/blob/master/script-opts/SmartSkip.conf>
- <https://github.com/mpv-player/mpv/blob/master/TOOLS/lua/autocrop.lua>
- <https://github.com/mar04/chapters_for_mpv/blob/main/chapters.lua>
