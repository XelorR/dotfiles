REM getting configuration files for NeoVim and for Vim
powershell "& Invoke-WebRequest https://raw.githubusercontent.com/XelorR/dotfiles/master/mini_init.vim -Out init.vim"
powershell "& Invoke-WebRequest https://raw.githubusercontent.com/XelorR/dotfiles/master/mini_vimrc -Out .vimrc"

REM getting theme and syntax highliting from external repos
powershell "& Invoke-WebRequest https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim -Out molokai.vim"
powershell "& Invoke-WebRequest https://raw.githubusercontent.com/hdima/python-syntax/master/syntax/python.vim -Out python.vim"

REM making directories
md "%userprofile%\AppData\Local\nvim\colors"
md "%userprofile%\AppData\Local\nvim\syntax"
md "%userprofile%\.vim\colors"
md "%userprofile%\.vim\syntax"

REM changing default theme in downloaded configs
powershell "& Get-Content init.vim | %%{$_ -replace 'desert', 'molokai'}" > _init.vim
powershell "& Get-Content .vimrc | %%{$_ -replace 'desert', 'molokai'}" > _vimrc

REM moving downloaded and edited files to final destination
copy python.vim "%userprofile%\.vim\syntax\"
move python.vim "%userprofile%\AppData\Local\nvim\syntax\"
copy molokai.vim "%userprofile%\.vim\colors\"
move molokai.vim "%userprofile%\AppData\Local\nvim\colors\"
move _vimrc "%userprofile%\.vimrc"
move _init.vim "%userprofile%\AppData\Local\nvim\init.vim"
