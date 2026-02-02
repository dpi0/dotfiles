# Bat

<https://github.com/sharkdp/bat#adding-new-themes>

<https://github.com/rebelot/kanagawa.nvim/issues/213#issuecomment-1987536469>

Run this once to load the custom `.tmTheme`

```bash
bat cache --build

bat --list-themes | fzf --preview="bat --theme={} --color=always ~/projects/lrcget_bash/lrcget_bash.sh"
```
