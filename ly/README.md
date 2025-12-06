# ly

<https://github.com/fairyglade/ly>

TUI Login Manager.

```bash
# Disable your previous login manager
sudo systemctl disable PREVIOUS_MANAGER.service
sudo systemctl enable ly
```

```bash
sudo mv /etc/ly/config.ini /etc/ly/config.ini.originai

sudo ln -s ~/.dotfiles/ly/config.ini /etc/ly/config.ini

sudo systemctl restart ly
# Or wait till the next boot or logout
```
