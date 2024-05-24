SetCapsLockState "AlwaysOff"
CapsLock::Escape

; define application groups
GroupAdd "vscodes", "ahk_exe Code.exe"
GroupAdd "vscodes", "ahk_exe VSCodium.exe"
GroupAdd "firefoxes", "ahk_exe firefox.exe"
GroupAdd "chromes", "ahk_exe chrome.exe"
GroupAdd "chromes", "ahk_exe brave.exe"
GroupAdd "chromes", "ahk_exe msedge.exe"
GroupAdd "office", "ahk_exe excel.exe"
GroupAdd "browsers", "ahk_group chromes"
GroupAdd "browsers", "ahk_group firefoxes"
GroupAdd "explorer", "ahk_class CabinetWClass ahk_exe explorer.exe"
GroupAdd "explorer", "ahk_class WorkerW ahk_exe explorer.exe"
GroupAdd "terminals", "ahk_exe WindowsTerminal.exe"
GroupAdd "notepads", "ahk_exe notepad.exe"

; define functionality groups
GroupAdd "history", "ahk_group browsers"
GroupAdd "history", "ahk_group explorer"
GroupAdd "tabsCTab", "ahk_group terminals"
GroupAdd "tabsCTab", "ahk_group notepads"
GroupAdd "tabsCTab", "ahk_group explorer"
GroupAdd "tabsCPgUp", "ahk_group vscodes"
GroupAdd "tabsCPgUp", "ahk_group browsers"
GroupAdd "tabsCPgUp", "ahk_group office"

; group used to exclude functionality
GroupAdd "completelyExclude", "ahk_class Emacs"
GroupAdd "explorerAndExlist", "ahk_group explorer"
GroupAdd "explorerAndExlist", "ahk_group completelyExclude"
GroupAdd "terminalsAndExlist", "ahk_group terminals"
GroupAdd "terminalsAndExlist", "ahk_group completelyExclude"
GroupAdd "vscodesAndExlist", "ahk_group vscodes"
GroupAdd "vscodesAndExlist", "ahk_group completelyExclude"

; GENERAL USAGE KEYS
#HotIf not WinActive("ahk_group completelyExclude")
{
; MOUSE
  !LButton::^LButton
  ^LButton::!LButton

; LETTERS
  !a::^a
  !b::^b
  !c::^c
  !d::^d
  !e::^e
  !f::^f
  ; !g::^g ; defined with vscodes exclusion
  !h::^h
  ; !i::^i ; defined with explorer exclusion
  !j::^j
  !k::^k
  !l::^l
  !m::^m
  !n::^n
  ; !o::^o ; defined with explorer exclusion
  !p::^p
  ; close window
  !q::!F4
  !r::^r
  !s::^s
  ; !t::^t ; defined with terminals exclusion
  !u::^u
  !v::^v
  ; !w::^w ; defined with terminals exclusion
  !x::^x
  !y::^y
  !z::^z

  !+a::!+a
  !+b::!+b
  !+c::!+c
  ; !+d::!+d ; defined with vscodes exclusion
  ; !+e::!+e ; defined with vscodes exclusion
  ; !+f::!+f ; defined with vscodes exclusion
  ; !+g::!+g ; defined with vscodes exclusion
  ; !+h::!+h ; defined with vscodes exclusion
  !+i::!+i
  !+j::!+j
  !+k::!+k
  ; !+l::!+l ; defined with vscodes exclusion
  !+m::!+m
  !+n::^+n ; new
  !+o::^+o ; optional open
  !+p::^+p ; cmd-shift-p
  !+q::!+q
  !+r::^+r ; refresh
  !+s::^+s ; save as
  !+t::^+t ; restore tab
  !+u::!+u
  !+v::!+v
  !+w::!+w
  ; !+x::!+x ; defined with vscodes exclusion
  !+y::!+y
  !+z::^y  ; redo

  ^!a::^!a
  ^!b::^!b
  ^!c::^!c
  ^!d::^!d
  ^!e::^!e
  ^!f::F11 ; toggle maximize (macos vscode-like)
  ^!g::^!g
  ^!h::^!h
  ^!i::^!i
  ^!j::^!j
  ^!k::^!k
  ^!l::^!l
  ^!m::^!m
  ^!n::^!n
  ^!o::^!o
  ^!p::^!p
  ^!q::^!q
  ^!r::^!r
  ^!s::^!s
  ^!t::Run A_ComSpec
  ^!u::^!u
  ^!v::^!v
  ^!w::^!w
  ^!x::^!x
  ^!y::^!y
  ^!z::^!z

  ^!+a::^!+a
  ^!+b::^!+b
  ^!+c::^!+c
  ^!+d::^!+d
  ^!+e::^!+e
  ^!+f::^!+f
  ^!+g::^!+g
  ^!+h::^!+h
  ^!+i::^!+i
  ^!+j::^!+j
  ^!+k::^!+k
  ^!+l::^!+l
  ^!+m::^!+m
  ^!+n::^!+n
  ^!+o::^!+o
  ^!+p::^!+p
  ^!+q::^!+q
  ^!+r::^!+r
  ^!+s::^!+s
  ^!+t::^!+t
  ^!+u::^!+u
  ^!+v::^!+v
  ^!+w::^!+w
  ^!+x::^!+x
  ^!+y::^!+y
  ^!+z::^!+z

  ^#!a::^#!a
  ^#!b::^#!b
  ^#!c::^#!c
  ^#!d::^#!d
  ^#!e::^#!e
  ^#!f::^#!f
  ^#!g::^#!g
  ^#!h::^#!h
  ^#!i::^#!i
  ^#!j::^#!j
  ^#!k::^#!k
  ^#!l::^#!l
  ^#!m::^#!m
  ^#!n::^#!n
  ^#!o::^#!o
  ^#!p::^#!p
  ^#!q::^#!q
  ^#!r::^#!r
  ^#!s::^#!s
  ^#!t::^#!t
  ^#!u::^#!u
  ^#!v::^#!v
  ^#!w::^#!w
  ^#!x::^#!x
  ^#!y::^#!y
  ^#!z::^#!z

  ^#!+a::^#!+a
  ^#!+b::^#!+b
  ^#!+c::^#!+c
  ^#!+d::^#!+d
  ^#!+e::^#!+e
  ^#!+f::^#!+f
  ^#!+g::^#!+g
  ^#!+h::^#!+h
  ^#!+i::^#!+i
  ^#!+j::^#!+j
  ^#!+k::^#!+k
  ^#!+l::^#!+l
  ^#!+m::^#!+m
  ^#!+n::^#!+n
  ^#!+o::^#!+o
  ^#!+p::^#!+p
  ^#!+q::^#!+q
  ^#!+r::^#!+r
  ^#!+s::^#!+s
  ^#!+t::^#!+t
  ^#!+u::^#!+u
  ^#!+v::^#!+v
  ^#!+w::^#!+w
  ^#!+x::^#!+x
  ^#!+y::^#!+y
  ^#!+z::^#!+z

; ARROWS
  #right::^right
  #left::^left
  ^#right::^#right
  ^#left::^#left
  ^p::up
  ^n::down
  ^f::right
  ^b::left
  ^a::home
  ^e::end

; WINDOW MANAGEMENT
  ^#Enter::WinMaximize "A"
  #h::WinMinimize "A"
  ;hide all windows except curren t
  !#h::
  {
    active_id := WinGetID("A")
    WinMinimizeAll
    WinActivate active_id
  }

; WORKSPACE MANAGEMENT
  ^up::#tab
  ^left::^#left
  ^right::^#right
  ^!up::^!up
  ^!down::^!down
  ^!left::^!left
  ^!right::^!right

; LAUNCHER
  !Space::#s
}

; DELETION
#HotIf not WinActive("ahk_group explorerAndExlist")
{
  !Backspace::Send("{Shift Down}{Home}{Shift Up}{Backspace}")
  #Backspace::^Backspace
  #Delete::^Delete
  ^d::Delete

; EXCLUDED FROM FILE MANAGER
  !Left::Home
  !Right::End
  !Up::^home
  !Down::^end
  !o::^o
  !i::^i
}

; FILE MANAGER
#HotIf WinActive("ahk_group explorer")
{
  Enter::F2
  !Down::Enter
  !o::Enter
  !i::!Enter
  !1::^+2 ; Cmd+1: View as Icons
  !2::^+6 ; Cmd+2: View as List (Detailed)
  !3::^+5 ; Cmd+3: View as List (Compact)
  !4::^+1 ; Cmd+4: View as Gallery
  !5::^+7 ; Cmd+5: Back to windows default view
  !Backspace::Delete
}

; EXCLUDED FROM TERMINALS
#HotIf not WinActive("ahk_group terminalsAndExlist")
{
  !t::^t
  !w::^w
}

; TERMINALS
#HotIf WinActive("ahk_group terminals")
{
  !t::^+t
  !w::^+w
}

; TABS
#HotIf WinActive("ahk_group tabsCPgUp")
{
  !+sc01B::^PgDn
  !+sc01A::^PgUp
}
#HotIf WinActive("ahk_group tabsCTab")
{
  !+sc01B::^Tab
  !+sc01A::^+Tab
}

; HISTORY
#HotIf WinActive("ahk_group history")
{
  !sc01B::!Right
  !sc01A::!Left
}

; OPEN SETTINGS
#HotIf WinActive("ahk_group chromes")
{
  !,::Send "{Ctrl Down}{t}{Ctrl Up}chrome://settings{Enter}"
}
#HotIf WinActive("ahk_group firefoxes")
{
  !,::Send "{Ctrl Down}{t}{Ctrl Up}about:preferences{Enter}"
}

; EXCLUDED FROM VSCODES
#HotIf not WinActive("ahk_group vscodesAndExlist")
{
  !+f::!+f
  !+h::!+h
  !+d::!+d
  !+e::!+e
  !+x::!+x
  !+l::!+l
  !g::!g
  !+g::!+g
  #up::!up
  #down::!down
}

; VSCODES
#HotIf WinActive("ahk_group vscodes")
{
  ; mouse
  ; #+LButton::!+LButton ; box selection | doesn't work by some reason
  ; move line up/down
  #up::!up
  #down::!down
  ; copy line up/down
  #+up::!+up
  #+down::!+down
  ; multiple cursors
  ; spawn up/down, linux-like
  ^+up::^!up
  ^+down::^!down
  ; spawn up/down, windows-like
  ^!up::!^up
  ^!down::!^down
  ; spawn up/down, macos-like
  !#up::^!up
  !#down::^!down
  #+i::!+i ; add cursors to the end of each line selected
  !F2::^F2 ; select all occurencies of selected word
  !+l::^+l ; select all occurencies of current selection
  ; selection
  !^+right::!+right ; expand selection
  !^+left::!+left ; shrink selection
  ; !#+left::!^+left ;    | doesn't work by some reason
  ; !#+right::!^+right ;  | doesn't work by some reason
  ; !#+up::!^+up ;        | doesn't work by some reason
  ; !#+down::!^+down ;    | doesn't work by some reason
  ; toggles
  !+h::^+h ; replace dialog
  !+d::Send("^+{p}show run and debug{Enter}")
  !+e::^+e ; file explorer
  !+f::^+f ; find dialog
  ^+g::Send("^+{g}g")
  !+x::Send("^+{p}view show extensions{Enter}")
  ; other
  !#f::^h ; replace
  #z::!z ; wrap
  #+f::!+f ; format
  !g::F3 ; find next
  !+g::+F3 ; find previous
  #F12::!F12 ; peek definition
  !Enter::^Enter ; Commit button in Source Control / insert line below
  ; !+Enter::^+Enter ; insert line above | doesn't work by some reason
  !,::^, ; open settings
  !.::^. ; quick fix
  !/::^/ ; comment
  !\::^\ ; split editor
  ; braces
  !sc01B::^sc01B ; indent
  !sc01A::^sc01A ; unindent
  !#sc01B::^+sc01B ; collapse
  !#sc01A::^+sc01A ; expand
  #+a::!+a ; block comment
  ; focus into editor groups
  !1::^1
  !2::^2
  !3::^3
  ; layout
  #+0::!+0 ; vertical / horisontal
}
