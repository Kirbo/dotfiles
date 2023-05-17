[ -s "$HOME/.bash_paths" ] && . $HOME/.bash_paths
[ -s "$HOME/.bash_aliases" ] && . $HOME/.bash_aliases

source "${DOTFILES}/bash/bash_command_timer.sh"

for FILE in $(ls -A ${DOTFILES}/local); do
  [ -s "${DOTFILES}/local/${FILE}" ] && . ${DOTFILES}/local/${FILE}
done

export HISTCONTROL=ignoredups
export HISTSIZE=100000

export EDITOR=nano

export PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

# if [ -f ~/.profile ]; then
#   source ~/.profile
# fi

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /Users/kirbo/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.bash ] && . /Users/kirbo/.config/yarn/global/node_modules/tabtab/.completions/electron-forge.bash

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-18.jdk/Contents/Home
#export JAVA_HOME=$(/usr/libexec/java_home -v1.8)
#export PATH=$JAVA_HOME/bin:$PATH

#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
