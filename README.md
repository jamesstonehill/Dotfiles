# Dotfiles
These dotfiles are still very much a work in progress so I wouldn't recommend
copying them wholesale, but you might find some things you like.

## Setup
You'll need to follow the setup instructions for the JazzCore/ctrlp-cmatcher. It requires some manually installation.

## Dependencies

\#|Dependency|Config File|Description|Installation
---|---|-----|------|----
1|neovim|vimrc|My vimrc is designed for neovim. Although it will generally work for vanilla vim, this means that there may be differences/difficulties that crop up if you use this vimrc with vim. For example, there are some config settings I've left out (such as `set nocompatible`) that make sense for vim but not for neovim.|`brew install neovim`
2|the_silver_searcher|vimrc|The Silver Searcher provides the ag executable. This is basically a much faster version of grep.|`brew install the_silver_searcher`
3|python|vimrc|Because neovim depends on python, it is best to have both python2 and python3 installed. python comes installed on Mac OS but you can check to see if your neovim has access to the system's python version by running `:CheckHealth` from within neovim.|`brew install python3`,`brew install python`

### Other things I use
- direnv
- nvm
