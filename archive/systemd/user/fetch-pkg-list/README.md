# `fetch-pkg-list`

```bash
mkdir -p ~/.config/systemd/user
ln -s $HOME/.dotfiles/systemd/user/fetch-pkg-list/fetch-pkg-list.service ~/.config/systemd/user/
ln -s $HOME/.dotfiles/systemd/user/fetch-pkg-list/fetch-pkg-list.timer ~/.config/systemd/user/

systemctl --user daemon-reload

systemctl --user enable --now fetch-pkg-list.timer

systemctl --user status fetch-pkg-list.timer
systemctl --user status fetch-pkg-list.service

systemctl list-timers --all | grep fetch-pkg-list
```
