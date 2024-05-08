if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# path
export PATH="$HOME/.local/bin:$HOME/.anaconda3/bin:$HOME/.cargo/bin:/usr/local/bin:$PATH"

if [[ $(uname -o) == "Darwin" ]]; then
	alias charm='/Applications/PyCharm\ CE.app/Contents/MacOS/pycharm'
	export PATH="/opt/homebrew/bin:$PATH"
	export HOMEBREW_INSTALL_FROM_API=1
fi

# prompt
if test -f "$HOME/.zprezto/init.zsh"; then
  source "$HOME/.zprezto/init.zsh"
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
elif test -f "$HOME/.oh-my-zsh/oh-my-zsh.sh"; then
  ZSH_THEME="powerlevel10k/powerlevel10k"
  export ZSH="$HOME/.oh-my-zsh"
  plugins=(git \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    zsh-history-substring-search \
    zsh-z)
  source $ZSH/oh-my-zsh.sh
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

# editor
if command -v emacs &>/dev/null; then
	alias em="emacs -nw -Q --eval '(progn (setq make-backup-files nil) (menu-bar-mode -1))'"
	alias macs="emacsclient -a '' -c -nw"
fi
if command -v nvim &>/dev/null; then
	export VISUAL=nvim
	alias vi='nvim --clean'
fi
export EDITOR=vi
if command -v fzf &>/dev/null; then
	alias vf='vi $(fzf)'
fi

# ALIASES ------------------------------
if command -v rsync &>/dev/null; then
	alias cpv='rsync -ah --info=progress2'
fi

# tmux
tm() {
	if [ $# -eq 0 ]; then
		tmux a || tmux
	else
		tmux a -t $1 || tmux new -s $1
	fi
}
alias tml='tmux list-sessions'

# terminal file manager
if command -v lf &>/dev/null; then
	lf() {
		# `command` is needed in case `lfcd` is aliased to `lf`
		cd "$(command lf -print-last-dir "$@")"
	}
fi

