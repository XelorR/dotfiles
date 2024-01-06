if status is-interactive
    set PATH ~/.local/bin ~/.cargo/bin/ $PATH

    # OS SPECIFIC
    switch (uname)
        case Linux
            if command -v xclip &>/dev/null
                alias pbcopy='xclip -selection clipboard'
                alias pbpaste='xclip -selection clipboard -o'
            end
            alias open=xdg-open
        case Darwin
            alias charm='/Applications/PyCharm\ CE.app/Contents/MacOS/pycharm'
            set PATH /opt/homebrew/bin $PATH
            set HOMEBREW_INSTALL_FROM_API 1
    end

    # EDITOR
    if command -v emacs &>/dev/null
        alias em="emacs -nw -Q --eval '(progn (setq make-backup-files nil) (menu-bar-mode -1))'"
        alias macs="emacsclient -a '' -c -nw"
    end
    if command -v nvim &>/dev/null
        set -gx VISUAL nvim
        alias vi=nvim
    end
    set -gx EDITOR vi

    # ALIAS
    if command -v rsync &>/dev/null
        alias cpv='rsync -ah --info=progress2'
    end
    alias tm='tmux a || tmux'
    alias ff='find . -type f -iname'
    alias la='ls -lisA'
    alias lt='du -sh * | sort -h'
    alias ll='ls -lh'
    alias ve='python3 -m venv ./venv'
    alias va='source ./venv/bin/activate'
    alias vd=deactivate
    alias www='ifconfig | grep broadcast ; python3 -m http.server'
    if command -v openssl &>/dev/null
        alias getpass="openssl rand -base64 20"
    end

    # FILE MANAGER
    if command -v lf &>/dev/null
        function lfcd --wraps="lf" --description="lf - Terminal file manager (changing directory on exit)"
            # `command` is needed in case `lfcd` is aliased to `lf`.
            # Quotes will cause `cd` to not change directory if `lf` prints nothing to stdout due to an error.
            cd "$(command lf -print-last-dir $argv)"
        end
        alias lf=lfcd
    end

    # PROMPT
    if command -v starship &>/dev/null
        starship init fish | source
    end
end
