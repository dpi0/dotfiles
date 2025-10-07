# `user - systemd`

### to clear up all services/timers created manually

```bash
ls ~/.config/systemd/user/
ls ~/.local/share/systemd/user/

rm -f ~/.config/systemd/user/*.service ~/.config/systemd/user/*.timer
rm -f ~/.local/share/systemd/user/*.service ~/.local/share/systemd/user/*.timer

systemctl --user daemon-reload
systemctl --user reset-failed

systemctl --user --list-unit-files
systemctl --user --list-timers
```
