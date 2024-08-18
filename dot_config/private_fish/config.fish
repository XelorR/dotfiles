if status is-interactive
    set fish_greeting

    if command -v hx &>/dev/null
        set -Ux EDITOR hx
        set -Ux VISUAL hx
        if command -v fzf &>/dev/null
            alias hz='hx $(fzf)'
        end
    else if command -v nvim &>/dev/null
        set -Ux EDITOR nvim
        set -Ux VISUAL nvim
    else
        set -Ux EDITOR vi
        set -Ux VISUAL vi
    end
    alias note='$VISUAL $HOME/org/journals/$(date +%Y_%m_%d).org'

    if command -v emacs &>/dev/null
        alias em="emacs -nw -Q --eval '(progn (setq make-backup-files nil) (menu-bar-mode -1))'"
        alias macs="emacsclient -a '' -c -nw"
        alias orgnote='em $HOME/org/journals/$(date +%Y_%m_%d).org'
    end

    function mkcd --description="Create directory and cd into it"
        mkdir -p $argv[1] && cd $argv[1]
    end

    function mkscript --description="Create script, mark executable and start editing"
        touch $argv[1] && chmod +x $argv[1] && $VISUAL $argv[1]
    end

    if command -v lf &>/dev/null
        function lf --wraps="lf" --description="lf - Terminal file manager (changing directory on exit)"
            cd "$(command lf -print-last-dir $argv)"
        end
    end
end

set -U fish_user_paths $HOME/.local/bin /usr/local/bin $fish_user_paths
switch (uname -o)
    case Darwin
        set -a fish_user_paths /opt/homebrew/bin
        set HOMEBREW_INSTALL_FROM_API 1
end
