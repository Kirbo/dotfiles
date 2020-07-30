[ -s "$HOME/.bashrc" ]  && . $HOME/.bashrc
[ -s "$HOME/.profile" ] && . $HOME/.profile

export BASH_SILENCE_DEPRECATION_WARNING=1

export GOPATH="$(go env GOPATH)"
export PATH="${PATH}:${GOPATH}/bin"

