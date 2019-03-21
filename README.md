# Dotfiles

## Grant me access to your machine via SSH-key:

```
curl -s https://gitlab.com/kirbo/dotfiles/raw/master/grant-me-access.sh | bash
```

## Installing the stuff on your machine:

```
git clone https://gitlab.com/kirbo/dotfiles.git
./dotfiles/install.sh
. ~/.bashrc_profile
```

## Installing latest `nvm`, `node`, `npm` and `yarn` on your machine:

```
install-nvm
```

## Using different version of node:

To use version `8.15.1`
```
update-nvm 8.15.1
```

To use version `10.15.3`
```
update-nvm 10.15.3
```

To use version `0.12.8`
```
update-nvm 0.12.8
```

Note that the command `update-nvm` also switched `npm` and `yarn` for the latest version for
the version of `node` you wanted to switch to. This command will also re-install all
the global packages you have installed, with the node version you wanted to use, so
in theory you shouldn't have to do anything manually, just run the command as shown above
and you should be good to go. If you run into any problems, refer to [`nvm` usage](https://github.com/creationix/nvm#usage).