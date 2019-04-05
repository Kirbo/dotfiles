[ -s "$HOME/.bash_paths" ]        && . $HOME/.bash_paths
[ -s "$HOME/.bash_aliases" ]      && . $HOME/.bash_aliases

for FILE in $(ls -A local); do
  [ -s "$HOME/local/${FILE}" ]    && . $HOME/local/${FILE}
done

export HISTCONTROL=ignoredups
export HISTSIZE=100000

export EDITOR=nano
