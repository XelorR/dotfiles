if status is-interactive

    # path
    set PATH ~/.local/bin ~/.anaconda3/bin ~/.config/emacs/bin /usr/local/bin $PATH
    switch (uname -o)
        case Darwin
            alias charm='/Applications/PyCharm\ CE.app/Contents/MacOS/pycharm'
            set PATH /opt/homebrew/bin $PATH
            set HOMEBREW_INSTALL_FROM_API 1
    end

    # prompt
    set fish_greeting

    set --global hydro_prefix_beginning \n
    set --global hydro_prefix_git " "
    set --global hydro_prefix_duration "󰅐 "

    set --global hydro_color_prompt 94e2d5
    set --global hydro_color_error f38ba8
    set --global hydro_color_pwd b4befe
    set --global hydro_color_git f9e2af
    set --global hydro_color_duration 94e2d5
    set --global hydro_multiline true

    # editor
    if command -v emacs &>/dev/null
        alias em="emacs -nw -Q --eval '(progn (setq make-backup-files nil) (menu-bar-mode -1))'"
        alias macs="emacsclient -a '' -c -nw"
    end
    if command -v nvim &>/dev/null
        set -gx VISUAL nvim
        alias vi='nvim --clean'
    end
    set -gx EDITOR vi
    if command -v fzf &>/dev/null
        alias vf='vi $(fzf)'
    end

    # terminal file manager
    if command -v lf &>/dev/null
        function lf --wraps="lf" --description="lf - Terminal file manager (changing directory on exit)"
            cd "$(command lf -print-last-dir $argv)"
        end
    end
end
