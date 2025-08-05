# `batsignal`
<https://github.com/electrickite/batsignal#systemd>

```bash
sudo systemctl daemon-reload
systemctl --user enable batsignal.service
systemctl --user start batsignal.service

mkdir -p ~/.config/systemd/user/batsignal.service.d

cp ~/.dotfiles/batsignal/options.conf ~/.config/systemd/user/batsignal.service.d/options.conf

systemctl --user daemon-reload

systemctl --user status batsignal.service
```
