# `vscode

- `./settings.json` goes in `$HOME/.config/Code/User/settings.json`
- `./keybindings.json` goes in `$HOME/.config/Code/User/keybindings.json`
- `./argv.json` is only for reference to fix the [keyring issue](https://code.visualstudio.com/docs/configure/settings-sync#_recommended-configure-the-keyring-to-use-with-vs-code) and the only line to add in vscode config is `"password-store":"gnome-libsecret"` OR for temporary access launch vscode with `code --password-store="gnome-libsecret"`
- to manually backup extensions list `code --list-extensions | xargs -L 1 echo code --install-extension > $HOME/.dotfiles/vscode/"code-extensions-list-$(date +'%d-%b-%Y_%H-%M-%S')"`
- then install `bash $HOME/.dotfiles/vscode/code-extensions-list-TIMESTAMP`
- to simply backup all important User related settings backup `$HOME/.config/Code/User` directory
