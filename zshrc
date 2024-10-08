if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# path
export PATH="$HOME/.local/bin:$HOME/.anaconda3/bin:$HOME/.cargo/bin:/usr/local/bin:$PATH"

if [[ $(uname -o) == "Darwin" ]]; then
  if [ -f "/Applications/PyCharm\ CE.app/Contents/MacOS/pycharm" ]; then
	  alias charm='/Applications/PyCharm\ CE.app/Contents/MacOS/pycharm'
  fi
	export PATH="/opt/homebrew/bin:$PATH"
	export HOMEBREW_INSTALL_FROM_API=1
  # GUI editor
  notepad() {
    open -t $@ &!
  }
elif command -v zeditor &>/dev/null; then
notepad() {
    zeditor --new $@ &!
  }
  alias zed=zeditor
  alias zn=notepad
elif command -v zedit &>/dev/null; then
notepad() {
    zedit --new $@ &!
  }
  alias zed=zedit
  alias zn=notepad
elif command -v kwrite &>/dev/null; then
  notepad() {
    kwrite $@ &!
  }
elif command -v kate &>/dev/null; then
  notepad() {
    kate $@ &!
  }
elif command -v gnome-text-editor &>/dev/null; then
  notepad() {
    gnome-text-editor $@ &!
  }
elif command -v gedit &>/dev/null; then
  notepad() {
    gedit $@ &!
  }
elif command -v leafpad &>/dev/null; then
  notepad() {
    leafpad $@ &!
  }
elif command -v emacs &>/dev/null; then
  notepad() {
    emacs $@ &!
  }
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
  if [ -f ~/AppData/Roaming/.config/doom/init.el ]; then
    alias macs="emacsclient -a '' -c -nw"
  fi
fi
if command -v nvim &>/dev/null; then
	export VISUAL=nvim
	alias vi='nvim --clean'
fi
export EDITOR=vi
if command -v fzf &>/dev/null; then
  if command -v nvim &>/dev/null; then
    alias vf='nvim $(fzf)'
  else
    alias vf='vi $(fzf)'
  fi
fi

# ALIASES ------------------------------
if command -v rsync &>/dev/null; then
	alias cpv='rsync -ah --info=progress2'
fi

# edit today note
if command -v macs &>/dev/null; then
  export NOTE_EDITOR='macs -nw'
elif command -v doom &>/dev/null; then
  export NOTE_EDITOR='doom -nw'
elif command -v spacemacs &>/dev/null; then
  export NOTE_EDITOR='spacemacs -nw'
elif command -v nvim &>/dev/null; then
  export NOTE_EDITOR='nvim'
else
  export NOTE_EDITOR='vi'
fi
alias note="$NOTE_EDITOR $HOME/org/journals/$(date +%Y_%m_%d).org"
alias notemd="$NOTE_EDITOR $HOME/org/pages/$(date +%Y%m%d%H%M%S).md $HOME/org/journals/$(date +%Y_%m_%d).org"

# create directory and cd into it
mkcd() {
    local dir=$1
    # Check if the directory already exists
    if [[ -d "$dir" ]]; then
        cd "$dir" || return 1
    else
        # Create the directory and change to it
        mkdir -p "$dir" && cd "$dir" || return 1
    fi
}

# print ip and share files through http protocol
www() {
  ip a | grep -E 'inet .*brd.* scope' | awk -F ' ' '{print $2}' && python3 -m http.server
}

# start editing executable file
mkscript() {
  touch $1 && chmod +x $1 && $VISUAL $1
}

if command -v minikube &>/dev/null; then
  alias kubectl="minikube kubectl --"
fi

# tmux
if command -v tmux &>/dev/null; then
  tm() {
    if [ $# -eq 0 ]; then
      tmux a || tmux
    else
      tmux a -t $1 || tmux new -s $1
    fi
  }
  alias tml='tmux list-sessions'
fi

# k8s
if command -v minikube &>/dev/null; then
  alias kubectl="minikube kubectl --"
fi

# terminal file manager
if command -v lf &>/dev/null; then
	lf() {
		# `command` is needed in case `lfcd` is aliased to `lf`
		cd "$(command lf -print-last-dir "$@")"
	}
fi

if [ -f /data/data/com.termux/files/usr/bin/termux-camera-photo ]; then
  export PATH=/data/data/com.termux/files/usr/bin:$PATH
fi
export EDITOR=hx
