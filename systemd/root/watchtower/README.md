# `watchtower`

```bash
sudo ln -sf $HOME/.dotfiles/systemd/root/watchtower/watchtower.service /etc/systemd/system/

sudo systemctl daemon-reload

sudo systemctl enable watchtower.service

sudo systemctl status watchtower.service

systemctl list-unit-files --all | grep watchtower
```
