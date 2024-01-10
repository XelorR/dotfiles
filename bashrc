
# PATH ------------------------------
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# OS SPECIFIC ------------------------------

if [[ $(uname) == "Darwin" ]]; then
	# PyCharm CLI tool for MacOS
	alias charm='/Applications/PyCharm\ CE.app/Contents/MacOS/pycharm'
	export PATH="/opt/homebrew/bin:$PATH"
	export HOMEBREW_INSTALL_FROM_API=1
else
	# MacOS-like pbcopy/pbpaste and open on GNU Linux
	if command -v xclip &>/dev/null; then
		alias pbcopy='xclip -selection clipboard'
		alias pbpaste='xclip -selection clipboard -o'
	fi
	alias open=xdg-open
fi

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

# ALIASES ------------------------------

if command -v rsync &>/dev/null; then
	alias cpv='rsync -ah --info=progress2'
fi
alias tm='tmux a || tmux'
alias ff='find . -type f -iname'
alias la='ls -lisA'
alias lt='du -sh * | sort -h'
alias ll='ls -lh'
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias vd=deactivate
alias www='ifconfig | grep broadcast ; python3 -m http.server'

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

# PROMPTS ------------------------------

if [ -z "${BASH_VERSINFO+x}" ]; then
  if test -f "$HOME/.oh-my-zsh/oh-my-zsh.sh"; then
    # ZSH VERSION -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
    # Initialization code that may require console input (password prompts, [y/n]
    # confirmations, etc.) must go above this block; everything else may go below.
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME="powerlevel10k/powerlevel10k"
    plugins=(git zsh-syntax-highlighting)
    source $ZSH/oh-my-zsh.sh
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
	elif command -v starship &>/dev/null; then
		eval "$(starship init zsh)"
	fi
else
  # BASH VERSION -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
  if test -f "$HOME/.oh-my-bash/oh-my-bash.sh"; then
    case $- in
      *i*) ;;
        *) return;;
    esac
    export OSH="$HOME/.oh-my-bash"
    OSH_THEME="purity"
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
	elif command -v starship &>/dev/null; then
		eval "$(starship init bash)"
	fi
fi
