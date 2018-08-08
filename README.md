# Dotfiles

## Setup
You'll need to follow the setup instructions for the JazzCore/ctrlp-cmatcher. It requires some manually installation.

## Dependencies

\#|Dependency|Config File|Description|Installation
---|---|-----|------|----
1|[neovim](https://github.com/neovim/neovim)|vimrc|My vimrc is designed for neovim. Although it will generally work for vanilla vim, this means that there may be differences/difficulties that crop up if you use this vimrc with vim. For example, there are some config settings I've left out (such as `set nocompatible`) that make sense for vim but not for neovim. You'll also need to point your neovim config to your vimrc file. |`brew install neovim`
2|[the_silver_searcher](https://github.com/ggreer/the_silver_searcher)|vimrc|The Silver Searcher provides the ag executable. This is basically a much faster version of grep.|`brew install the_silver_searcher`
3|python|vimrc|Because neovim depends on python, it is best to have both python2 and python3 installed. python comes installed on Mac OS but you can check to see if your neovim has access to the system's python version by running `:CheckHealth` from within neovim.|`brew install python3`,`brew install python`
4|[Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#basic-installation)|zshrc|A Zsh framework| https://github.com/robbyrussell/oh-my-zsh#basic-installation `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

### Other things I use
- direnv
- nvm
