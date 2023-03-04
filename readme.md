# Evoagile dotfiles

## Installing

You will need `git` and GNU `stow`

Clone into your `$HOME/localgit` directory

```bash
cd $HOME/localgit
git clone https://github.com/erdosxx/evoagile_configs.git
```

Run `stow` to symlink everything or just select what you want

```bash
cd $HOME/localgit/evoagile_configs
stow -t ~ */  # Everything (the '/' ignore the README and 10-keyboard.conf)
# This is for GB(UK) keyboard layout
sudo ln -s 10-keyboard.conf /etc/X11/xorg.conf.d/10-keyboard.conf
```

```bash
stow -t ~ zsh  # Just my zsh config
```
