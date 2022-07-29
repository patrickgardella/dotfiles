# Patrick's dotfiles

Configure my local environment on a new system

```
./bootstrap.sh
git config --global user.name "Your Name"
git config --global user.email you@example.com
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
git commit
```

## Remove a package
```
git submodule deinit .vim/pack/plugins/start/vim-airline
git rm .vim/pack/plugins/start/vim-airline
rm -Rf .git/modules/.vim/pack/plugins/start/vim-airline
git commit
```

## To-Do:

Solarized for xterm & iterm

### Thanks to:

* https://github.com/mathiasbynens/dotfiles
* https://github.com/holman/dotfiles
