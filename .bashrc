[ -s "$HOME/.bash_aliases" ]        && . $HOME/.bash_aliases
[ -s "$HOME/.local_bash_aliases" ]  && . $HOME/.local_bash_aliases
[ -s "$HOME/.bash_paths" ]          && . $HOME/.bash_paths

export HISTCONTROL=ignoredups
export HISTSIZE=100000

export EDITOR=nano
