# Dotfiles

These are my dotfiles. Like pretty much all dotfiles, they are largely stolen
from other, smarter people. Let me know if you find them useful or if you have
any suggestions for how they could be improved!

## Setup

First start by cloning this repo into your home directory.

```shell
cd ~
git clone https://github.com/jamesstonehill/Dotfiles.git
```

Then symlink the files that don't require alteration
```bash
ln -s ~/Dotfiles/zshrc ~/.zshrc
ln -s ~/Dotfiles/init.lua ~/.config/nvim/init.lua
ln -s ~/Dotfiles/lua/ ~/.config/nvim/
ln -s ~/Dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/Dotfiles/gitattributes ~/.gitattributes
ln -s ~/Dotfiles/irbrc ~/.irbrc
ln -s ~/Dotfiles/gemrc ~/.gemrc
ln -s ~/Dotfiles/pryrc ~/.pryrc
ln -s ~/Dotfiles/asdfrc ~/.asdfrc
ln -s ~/Dotfiles/default-gems ~/.default-gems
```

And copy and edit the files that do require alteration
```bash
cp ~/Dotfiles/gitconfig ~/.gitconfig
```

### Installing Dependencies

My dotfiles have a few dependencies. Most of these can be installed with
[homebrew](https://brew.sh/).

To install these dependencies with homebrew `cd` into the Dotfiles directory and
type `brew bundle`. You can comment out any dependencies you don't want in the
Brewfile.

Some of my dotfiles have Ruby gem dependencies. If you have a working ruby
version running locally you can install these by running `bundle install` inside
this directory.

Below I've included some instructions for setup specific to individual dotfiles.

### zshrc

I use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). You'll need to
install oh-my-zsh for my zshrc config to work. To download it see the
instructions on the oh-my-zsh github page.

### vimrc

To install the vim packages first install
[vim-plug](https://github.com/junegunn/vim-plug).

Then inside vim run `:PackerInstall`.

#### Linting

I'm using [mason.nvim](https://github.com/williamboman/mason.nvim) to install linting packages. To view the available linting packages run in vim `:Mason`. This will bring up a window of the various libraries you can install. Then to install one run something like `:MasonInstall black`.

### gitconfig

You'll need to replace `<YOUR NAME>` and `<YOUR EMAIL>` with your name and
email.

### Terminal

For a terminal I use [iTerm2](https://www.iterm2.com/). I've included an iTerm
theme that matches my vim theme in this repo for ease. This file is the
Jellybeans.itermcolors file. See iTerm2 documentation on how to setup this
theme.

In order to enable powerline fonts you'll want to enable the option here in
iterm.
https://apple.stackexchange.com/a/413332/223301
