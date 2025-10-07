# `auto-change-system-theme`

```bash
mkdir -p ~/.config/systemd/user
ln -s $HOME/.dotfiles/systemd/user/auto-change-system-theme/auto-change-system-theme.service ~/.config/systemd/user/

systemctl --user daemon-reload

systemctl --user enable --now auto-change-system-theme.service

systemctl --user status auto-change-system-theme.service

systemctl list-unit-files --all | grep auto-change-system-theme
```
