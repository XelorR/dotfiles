if status is-interactive

    # path
    set PATH ~/.local/bin $PATH
    switch (uname -o)
        case Darwin
            # MAC AND HOMEBREW SPECIFIC CONFIG ------------------------------
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
    set --global hydro_multiline true
end
