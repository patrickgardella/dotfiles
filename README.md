# Patrick's dotfiles

Configure my local environment on a new system

```
./install
./bootstrap.sh
git config --global user.name "Your Name"
git config --global user.email you@example.com
git config --global core.editor "vim" 
```

# VIM packages

## Adding a package

```
cd ~/dotfiles
git submodule init
git submodule add https://github.com/vim-airline/vim-airline.git .vim/pack/plugins/start/vim-airline
git add .gitmodules .vim/pack/plugins/start/vim-airline
git commit
```

## Update a package

```
git submodule update --remote --merge
git add .
git commit
```

## Remove a package

```
git submodule deinit .vim/pack/plugins/start/vim-airline
git rm .vim/pack/plugins/start/vim-airline
rm -Rf .git/modules/.vim/pack/plugins/start/vim-airline
git add .
git commit
```

## To-Do:

Solarized for xterm & iterm

### Thanks to:

- https://github.com/anishathalye/dotbot
- https://www.elliotdenolf.com/blog/bootstrap-your-dotfiles-with-dotbot
- https://github.com/mathiasbynens/dotfiles
- https://github.com/holman/dotfiles
