# Dotfiles

This repository is meant to be run on Linux or Mac. In theory this should also work in
`bash for Windows`, but I give you no guarantee.

The purpose for this repository is mainly to make my life with new machines/servers
a whole lot easier, so that I have all my common scripts in use on all the machines,
as well as the SSH-keys that I usually use, for enabling/disabling access from
certain predefined machines with ease.

## Grant me access to your machine via SSH-key:

```
curl -s https://gitlab.com/kirbo/dotfiles/raw/master/grant-access-for-kirbo.sh | bash
```

## Installing the stuff on your machine:

```
git clone https://gitlab.com/kirbo/dotfiles.git
./dotfiles/install.sh
. ~/.bashrc_profile
```

### Installing latest `nvm`, `node`, `npm` and `yarn` on your machine:

```
install-nvm
```

### Using different version of node:

To use version `8.15.1`
```
use-node 8.15.1
```

To use version `10.15.3`
```
use-node 10.15.3
```

To use version `0.12.8`
```
use-node 0.12.8
```

Note that the command `use-node` also switched `npm` and `yarn` for the latest version for
the version of `node` you wanted to switch to. This command will also re-install all
the global packages you have installed, with the node version you wanted to use, so
in theory you shouldn't have to do anything manually, just run the command as shown above
and you should be good to go. If you run into any problems, refer to [`nvm` usage](https://github.com/creationix/nvm#usage).


## Reloading the stuff in your current terminal session:

```
reload-terminal
```


## Updating the `dotfiles`:

```
update-dotfiles
reload-terminal
```


## Enable SSH-key in remote server:

To enable `.ssh/keys/MBP2018.pub` in `kirbo@devaus.eu`, run command:
```
remote-enable-key MBP2018 kirbo@devaus.eu
```