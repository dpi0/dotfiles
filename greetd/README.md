# `greetd`

**fix the login keyring issue on every boot**

<https://r.i0w.xyz/r/swaywm/comments/13idzjz/greetd_gnome_keyring/jk9so1s/?context=3#jk9so1s>

```bash
sudo cp /etc/pam.d/greetd /etc/pam.d/greetd.bak

# replace the contents of this file (after backing up)
# so no "-a" used for "tee" command
sudo tee /etc/pam.d/greetd << EOF
#%PAM-1.0

auth       required     pam_securetty.so
auth       requisite    pam_nologin.so
auth       include      system-local-login
auth       optional     pam_gnome_keyring.so
account    include      system-local-login
session    include      system-local-login
session    optional     pam_gnome_keyring.so auto_start
EOF
```
