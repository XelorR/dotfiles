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
  !g::^g
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
  !+d::!+d
  !+e::!+e
  ; !+f::!+f ; defined with vscodes exclusion
  !+g::!+g
  !+h::!+h
  !+i::!+i
  !+j::!+j
  !+k::!+k
  !+l::!+l
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
  !+x::!+x
  !+y::!+y
  !+z::^y  ; redo

  ^!a::^!a
  ^!b::^!b
  ^!c::^!c
  ^!d::^!d
  ^!e::^!e
  ^!f::^!f
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
  #Enter::WinMaximize "A"
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
}

; FILE MANAGER
#HotIf WinActive("ahk_group explorer")
{
  Enter::F2
  !Down::Enter
  !o::Enter
  !i::!Enter
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
  ; cursors spawn up/down, works all 3 OS variants
  ;    linux
  ^+up::^!up
  ^+down::^!down
  ;    windows
  ^!up::!^up
  ^!down::!^down
  ;    macos
  ^#up::^!up
  ^#down::^!down
  ; toggles
  !+d::Send("^+{p}run and debug{Enter}")
  !+e::Send("^+{p}focus on file explorer{Enter}")
  !+f::^+f
  !g::Send("^+{g}g")
  !+x::Send("^+{p}view show extensions{Enter}")
  ; other
  #z::!z ; wrap
  #+f::!+f ; format
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
}
