[ -s "$HOME/.bashrc" ]  && . $HOME/.bashrc
[ -s "$HOME/.profile" ] && . $HOME/.profile

export BASH_SILENCE_DEPRECATION_WARNING=1

GO_INSTALLED=$(which go)
if ! [[ -z "${GO}" ]]; then
	export GOROOT=$(go env GOROOT)
	export GOPATH=$(go env GOPATH)
	export PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"
fi
