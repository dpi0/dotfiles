# `battery-level-check`

```bash
mkdir -p ~/.config/systemd/user
ln -s $HOME/.dotfiles/systemd/user/battery-level-check/battery-level-check.service ~/.config/systemd/user/
ln -s $HOME/.dotfiles/systemd/user/battery-level-check/battery-level-check.timer ~/.config/systemd/user/

systemctl --user daemon-reload

systemctl --user enable --now battery-level-check.timer

systemctl --user status battery-level-check.timer
systemctl --user status battery-level-check.service

systemctl --user list-timers --all | grep battery-level-check
```
