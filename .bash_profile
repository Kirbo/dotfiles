[ -s "$HOME/.bashrc" ]  && . $HOME/.bashrc
[ -s "$HOME/.profile" ] && . $HOME/.profile

export BASH_SILENCE_DEPRECATION_WARNING=1

GO_INSTALLED=$(which go)
if ! [[ -z "${GO}" ]]; then
	export GOROOT=$(go env GOROOT)
	export GOPATH=$(go env GOPATH)
	export PATH="${GOPATH}/bin:${GOROOT}/bin:${PATH}"
fi

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH
