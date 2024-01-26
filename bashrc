# PATH ------------------------------
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# PROMPTS ------------------------------
if [ -z "${BASH_VERSINFO+x}" ]; then
	# ZSH VERSION -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	if command -v thefuck &>/dev/null; then
		eval $(thefuck --alias)
	fi
	# Prezto + Starship
	if test -f "$HOME/.zprezto/init.zsh"; then
		source "$HOME/.zprezto/init.zsh"
		# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
		if command -v starship &>/dev/null; then
			eval "$(starship init zsh)"
		fi
	# Oh-my-zsh + Starship
	elif test -f "$HOME/.oh-my-zsh/oh-my-zsh.sh"; then
		export ZSH="$HOME/.oh-my-zsh"
		if command -v starship &>/dev/null; then
			eval "$(starship init zsh)"
		fi
		plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search)
		source $ZSH/oh-my-zsh.sh
		# Starship only
	elif command -v starship &>/dev/null; then
		eval "$(starship init zsh)"
	fi
else
	# BASH VERSION -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	# Oh-my-bash
	if test -f "$HOME/.oh-my-bash/oh-my-bash.sh"; then
		case $- in
		*i*) ;;
		*) return ;;
		esac
		export OSH="$HOME/.oh-my-bash"
		if command -v starship &>/dev/null; then
			eval "$(starship init bash)"
		else
			OSH_THEME="rana"
		fi
		OMB_USE_SUDO=true
		completions=(
			git
			composer
			ssh
		)
		aliases=(
			general
		)
		plugins=(
			git
			bashmarks
		)
		source "$OSH"/oh-my-bash.sh
		# Starship
	elif command -v starship &>/dev/null; then
		eval "$(starship init bash)"
	fi
fi

# OS SPECIFIC ------------------------------
if [[ $(uname -o) == "Darwin" ]]; then
	# PyCharm CLI tool for MacOS
	alias charm='/Applications/PyCharm\ CE.app/Contents/MacOS/pycharm'
	export PATH="/opt/homebrew/bin:$PATH"
	export HOMEBREW_INSTALL_FROM_API=1
# MacOS-like pbcopy/pbpaste and open on GNU Linux
elif [[ $(uname -o) == "Android" ]]; then
	alias pbcopy='termux-clipboard-set'
	alias pbpaste='termux-clipboard-get'
	alias open='termux-open'
elif [[ $(uname -o) == "GNU/Linux" ]]; then
	if command -v xclip &>/dev/null; then
		alias pbcopy='xclip -selection clipboard'
		alias pbpaste='xclip -selection clipboard -o'
	elif command -v xsel &>/dev/null; then
		alias pbcopy='xsel --clipboard --input'
		alias pbpaste='xsel --clipboard --output'
	elif command -v wl-copy &>/dev/null; then
		alias pbcopy='wl-copy'
		alias pbpaste='wl-paste'
	fi
	alias open=xdg-open
fi
alias pbc=pbcopy
alias pbp=pbpaste
alias o=open

# EDITORS ------------------------------
if command -v emacs &>/dev/null; then
	alias em="emacs -nw -Q --eval '(progn (setq make-backup-files nil) (menu-bar-mode -1))'"
	alias macs="emacsclient -a '' -c -nw"
	alias emax="emacsclient -a '' -c"
fi
if command -v nvim &>/dev/null; then
	export VISUAL=nvim
	alias vi=nvim
fi
export EDITOR=vi
if command -v fzf &>/dev/null; then
	alias vf='vi $(fzf)'
fi

# ALIASES ------------------------------
if command -v rsync &>/dev/null; then
	alias cpv='rsync -ah --info=progress2'
fi
alias ff='find . -type f -iname'
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias vd=deactivate
alias www='ifconfig | grep broadcast ; python3 -m http.server'

# Tmux
tm() {
	if [ $# -eq 0 ]; then
		tmux a || tmux
	else
		tmux a -t $1 || tmux new -s $1
	fi
}
alias tml='tmux list-sessions'

# DOWNLOAD FILES ------------------------------
if command -v aria2c &>/dev/null; then
	alias get='aria2c --continue --remote-time --max-tries=0'
elif command -v curl &>/dev/null; then
	alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'
elif command -v wget &>/dev/null; then
	alias get='wget --continue --progress=bar --timestamping'
fi

# VIEW RESOURCE USAGE ------------------------------
alias df='df -kh'
alias du='du -kh'

# LISTING DIRECTORY ------------------------------
alias l='ls -1A'         # Lists in one column, hidden files.
alias ll='ls -lh'        # Lists human readable sizes.
alias lr='ll -R'         # Lists human readable sizes, recursively.
alias la='ll -A'         # Lists human readable sizes, hidden files.
alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
alias lk='ll -Sr'        # Lists sorted by size, largest last.
alias lt='ll -tr'        # Lists sorted by date, most recent last.
alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.

# Managing dotfiles
if command -v chezmoi &>/dev/null; then
	alias cz='chezmoi'
	alias czu='chezmoi update'
	alias czp='chezmoi apply'
	alias cza='chezmoi add'
	alias czcd='chezmoi cd'
	alias cze='chezmoi edit'
	alias czea='chezmoi edit --apply'
	alias czra='chezmoi re-add'
fi

# Generating passwords
if command -v openssl &>/dev/null; then
	alias getpass="openssl rand -base64 20"
fi

# Navigating directories
if command -v lf &>/dev/null; then
	lfcd() {
		# `command` is needed in case `lfcd` is aliased to `lf`
		cd "$(command lf -print-last-dir "$@")"
	}
	alias lf=lfcd
fi
