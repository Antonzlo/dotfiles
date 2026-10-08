#!/bin/sh
# Symlink dotfiles into $HOME (backs up an existing real file once).
set -e
cd "$(dirname "$0")"
for f in .zshrc; do
  [ -e ~/$f ] && [ ! -L ~/$f ] && mv ~/$f ~/$f.bak
  ln -sfn "$PWD/$f" ~/$f
done
