[ -s "$HOME/.bash_paths" ]        && . $HOME/.bash_paths
[ -s "$HOME/.bash_aliases" ]      && . $HOME/.bash_aliases

for FILE in $(ls -A ${DOTFILES}/local); do
  [ -s "${DOTFILES}/local/${FILE}" ]    && . ${DOTFILES}/local/${FILE}
done

export HISTCONTROL=ignoredups
export HISTSIZE=100000

export EDITOR=nano

export PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

if [ -f ~/.profile ]; then
    source ~/.profile
fi

