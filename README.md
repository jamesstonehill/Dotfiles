# Dotfiles
These are my dotfiles. Like pretty much all dotfiles, they are largely stolen
from other, smarter people. Let me know if you find them useful or if you have
any suggestions for how they could be improved!

## Setup
My dotfiles have a few dependencies. Most of these can be installed with
[homebrew](https://brew.sh/).

To install these dependencies with homebrew clone this repo then `cd` into the
Dotfiles directory and type `brew bundle`. You can comment out any dependencies
you don't want in the Brewfile.

Below I've included some instructions for setup specific to individual dotfiles.

### zshrc
I use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh). You'll need to
install oh-my-zsh for my zshrc config to work. To download it see the
instructions on the oh-my-zsh github page.

### vimrc
To install the vim packages first install
[vim-plug](https://github.com/junegunn/vim-plug).

Then inside vim run `:PlugInstall`.

After installing the vim plugins, you'll also need to do some manual
configuration to compile the C code that comes with the
[ctrlp-cmatcher](https://github.com/JazzCore/ctrlp-cmatcher) plugin. You can
find details for this on the github page for this plugin
[here](https://github.com/JazzCore/ctrlp-cmatcher#installation).

#### Linting
For code linting, I use [ALE](https://github.com/w0rp/ale) which stands for
Asynchronous Lint Engine. ALE acts as a universal interface to underlying
linting libraries. However, ALE does not pre-install these linting libraries and
will only make use of them when they are already available. This means that in
order to make full use of ALE you need to install some additional libraries. You
can see the exact breakdown of their supported linting libraries broken down by
language [here](https://github.com/w0rp/ale#supported-languages).

For example, in order to install the full set of ruby linting packages that ALE
supports do the following:

```shell
gem install brakeman rails_best_practices reek rubocop ruby solargraph
```

However, you may not want all of a language's linting packages as many have
overlapping functionality and some may not be relevant to the framework you are
using so I recommend reading up on the package before installing it.

### pryrc/irbrc
My pryrc and irbrc use a gem called `awesome_print`. You can install by running
`gem install awesome_print`.

### gitconfig
You'll need to replace `<YOUR NAME>` and `<YOUR EMAIL>` with your name and
email.
