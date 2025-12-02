# Batsignal

<https://github.com/electrickite/batsignal>

Notifies at different levels of battery. Useful when battery too low or too high.

```bash
mkdir -p ~/.config/systemd/user/batsignal.service.d
ln -s ~/.dotfiles/batsignal/options.conf ~/.config/systemd/user/batsignal.service.d/options.conf

systemctl --user daemon-reload
systemctl --user enable --now batsignal.service
systemctl --user status batsignal.service
```

To send a notification

```bash
ExecStart=batsignal -c 20 -w 28 -f 95 -p -e \
   -M "/path/to/script/notify.sh '%%s' '%%s'"
```

Here,

- `-c 5` critical level 5%
- `-w 20` warning level 20%
- `-f 95` full level 95%
- `-p` notify when plugged/unplugged
- `-e` notifications expire and go away
- `-M` trigger a command
