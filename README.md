# dotfiles

Plain zsh config, no framework.

```sh
sudo dnf install zsh zsh-autosuggestions zsh-syntax-highlighting fzf zoxide
git clone git@github.com:Antonzlo/dotfiles.git ~/dotfiles && ~/dotfiles/install.sh
chsh -s /usr/bin/zsh
```

Put machine-specific stuff in `~/.zshrc.local`.
