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
GroupAdd "tabsCTab", "ahk_exe KeePass.exe"
GroupAdd "tabsCPgUp", "ahk_group vscodes"
GroupAdd "tabsCPgUp", "ahk_group browsers"
GroupAdd "tabsCPgUp", "ahk_group office"
GroupAdd "extended_editing_capabilities", "ahk_groups notepads"

; group used to exclude functionality
GroupAdd "completelyExclude", "ahk_class Emacs"

GroupAdd "exclude_terminals_filemanagers", "ahk_group terminals"
GroupAdd "exclude_terminals_filemanagers", "ahk_group explorer"
GroupAdd "exclude_terminals_filemanagers", "ahk_group completelyExclude"

GroupAdd "exclude_terminals_filemanagers_binds", "ahk_group terminals"
GroupAdd "exclude_terminals_filemanagers_binds", "ahk_group explorer"
GroupAdd "exclude_terminals_filemanagers_binds", "ahk_group completelyExclude"
GroupAdd "exclude_terminals_filemanagers_binds", "ahk_group vscodes"

; ABSOLUTE GLOBAL -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
; MISSION CONTROL
^Up::#Tab
F3::#Tab
^Left::^#Left
^Right::^#Right
; WINDOW MANAGEMENT
^#Left::#Left
^#Right::#Right
^#Enter::WinMaximize "A"
#h::WinMinimize "A"
!#h::
{
  active_id := WinGetID("A")
  WinMinimizeAll
  WinActivate active_id
}
; LAUNCHERS
!Space::#s
^!t::Run A_ComSpec, A_MyDocuments
; LOCK
^!q::DllCall("LockWorkStation")

; GLOBAL -- EVERYTHING WITH EXCEPTIONS -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
; LETTERS
; exclude terminals, filemanagers and cpecificly binded apps
#HotIf not WinActive("ahk_group exclude_terminals_filemanagers_binds")
{
  !a::^a
  !b::^b
  !c::^c
  !d::^d
  !e::^e
  !f::^f
  !g::^g
  !h::^h
  !i::^i
  !j::^j
  !k::^k
  !l::^l
  !m::^m
  !n::^n
  !o::^o
  !p::^p
  !q::!F4
  !r::^r
  !s::^s
  !t::^t
  !u::^u
  !v::^v
  !w::^w
  !x::^x
  !y::^y
  !z::^z

  !+a::!+a
  !+b::!+b
  !+c::!+c
  !+d::!+d
  !+e::!+e
  !+f::!+f
  !+g::!+g
  !+h::!+h
  !+i::!+i
  !+j::!+j
  !+k::!+k
  !+l::!+l
  !+m::!+m
  !+n::^+n ; new
  !+o::^+o ; optional openn
  !+p::^+p ; cmd-shift-p
  !+q::!+q
  !+r::^+r ; refresh
  !+s::^+s ; save as
  !+t::^+t ; restore tab
  !+u::^+u ; keepassxc open link
  !+v::!+v
  !+w::!+w
  !+x::!+x
  !+y::!+y
  !+z::^y ; redo

  ^!a::^!a
  ^!b::^!b
  ^!c::^!c
  ^!d::^!d
  ^!e::^!e
  ^!f::F11 ; fullscreen
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
  ^!q::DllCall("LockWorkStation") ; lock screen
  ^!r::^!r
  ^!s::^!s
  ^!t::Run A_ComSpec, A_MyDocuments
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
}
; ARROWS
; exclude terminals and filemanagers
#HotIf not WinActive("ahk_group exclude_terminals_filemanagers")
{
  #Right::^Right
  #Left::^Left
  !Left::Home
  !Right::End
  !Up::^Home
  !Down::^End
  ^p::Up
  ^n::Down
  ^f::Right
  ^b::Left
  ^a::Home
  ^e::End
  ^d::Delete
}
; DELETION
; exclude terminals and filemanagers
#HotIf not WinActive("ahk_group exclude_terminals_filemanagers")
{
  !BackSpace::Send "+{Home}{BackSpace}"
  #BackSpace::^BackSpace
}

; EXCEPTIONS ONLY -- FUNCTIONALITY -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
; FILE MANAGER
#HotIf WinActive("ahk_group explorer")
{
  Enter::F2
  !Down::Enter
  !1::^+2 ; Cmd+1: View as Icons
  !2::^+6 ; Cmd+2: View as List (Detailed)
  !3::^+5 ; Cmd+3: View as List (Compact)
  !4::^+1 ; Cmd+4: View as Gallery
  !5::^+7 ; Cmd+5: Back to windows default view
  !+n::^+n
  !a::^a
  !b::^b
  !c::^c
  !d::^d
  !e::^e
  !f::^f
  !g::^g
  !h::^h
  !i::!Enter
  !j::^j
  !k::^k
  !l::^l
  !m::^m
  !n::^n
  !o::Enter
  !p::^p
  !q::^q
  !r::^r
  !s::^s
  !t::^t
  !u::^u
  !v::^v
  !w::^w
  !x::^x
  !y::^y
  !z::^z
  !Backspace::Delete
  !+BackSpace::+Delete
  ^!f::F11
}

; TABS
#HotIf WinActive("ahk_group tabsCPgUp")
{
  !+sc01B::^PgDn
  !+sc01A::^PgUp
}
#HotIf WinActive("ahk_group tabsCTab")
{
  ^PgDn::^Tab
  ^PgUp::^+Tab
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

; TERMINALS
#HotIf WinActive("ahk_group terminals")
{
  ^!q::DllCall("LockWorkStation")
  !q::!F4
  !n::^+n
  !t::^+t
  ^!t::Run A_ComSpec, A_MyDocuments
  !w::^+w
  ^!f::F11
  !Left::Home
  !Right::End
  !Up::^Home
  !Down::^End
  #Right::^Right
  #Left::^Left
  #Right::^f
  #Left::^b
  !BackSpace::Send "+{Home}{BackSpace}"
  #BackSpace::^BackSpace
  #Delete::^Delete
  #d::^Delete
  ^w::^Delete
  ^p::Up
  ^n::Down
  ^f::Right
  ^b::Left
  ^a::Home
  ^e::End
  ^d::Delete
  !,::^,
  !+9::!+=
  !+0::!+-
}

; EXCEPTIONS ONLY -- VERY APP SPECIFIC -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
; VSCODES
#HotIf WinActive("ahk_group vscodes")
{
  ;; LETTERS
  !a::^a
  !b::^b
  !c::^c
  !d::^d
  !e::^e
  !f::^f
  !g::^F3
  !h::^h
  !i::^i
  !j::^j
  !k::^k
  !l::^l
  !m::^m
  !n::^n
  !o::^o
  !p::^p
  !q::!F4
  !r::^r
  !s::^s
  !t::^t
  !u::^u
  !v::^v
  !w::^w
  !x::^x
  !y::^y
  !z::^z

  !+a::!+a
  !+b::!+b
  !+c::!+c
  !+d::^+d
  !+e::^+e
  !+f::^+f
  !+g::^+F3
  !+h::!+h
  !+i::!+i
  !+j::!+j
  !+k::^+k
  !+l::!+l
  !+m::^+m
  !+n::^+n
  !+o::^+o
  !+p::^+p
  !+q::!+q
  !+r::^+r
  !+s::^+s
  !+t::^+t
  !+u::!+u
  !+v::!+v
  !+w::!+w
  !+x::^+x
  !+y::!+y
  !+z::^y

  !^t::!^t

  ;; GENERAL
  !,::^, ; open settings

  ;; BASIC EDITING
  #up::!up
  #down::!down
  #+up::!+up
  #+down::!+down
  !Enter::^Enter
  !+Enter::^+Enter
  !+\::^+\
  !sc01B::^sc01B ; indent
  !sc01A::^sc01A ; unindent
  ^PgUp::^!PgUp
  ^PgDn::^!PgDn
  !PgUp::+PgUp
  !PgDn::+PgDn
  !#sc01B::^+sc01B ; collapse
  !#sc01A::^+sc01A ; expand
  !/::^/ ; comment
  #+a::!+a ; block comment
  #z::!z ; wrap

  ;; MULTI-CURSOR AND SELECTION
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
  #+i::!+i
  !F2::^F2
  ^!+Right::!+Right
  ^!+Left::!+Left
  !#+left::!^+left
  !#+right::!^+right
  !#+up::!^+up
  !#+down::!^+down
  !#+pgup::!^+pgup
  !#+pgdn::!^+pgdn

  ;; SEARCH AND REPLACE
  #Enter::^+l

  ;; RICH LANGUAGES EDITING
  ^#Space::^+Space
  #+f::!+f
  #F12::!F12
  !.::^. ; quick fix

  ;; NAVIGATION
  +F8::!F8
  ^-::!Left
  ^+-::!Right
  ^+m::^m

  ;; EDITOR MANAGEMENT
  !\::^\
  !1::^1
  !2::^2
  !3::^3
  !4::^4
  !5::^5
  !6::^6
  !7::^7
  !8::^8
  !9::^9
  !0::^0

  ;; FILE MANAGEMENT

  ;; DISPLAY
  #+0::!+0 ; vertical / horisontal
  #!f::^h
  ^+g::Send("^+{g}g")
  ^!f::F11
  !=::^=
  !-::^-
}

; NOTEPADS
#HotIf WinActive("ahk_group extended_editing_capabilities")
{
  #f::^Right
  #b::^Left
  #d::^Delete
  ^k::Send "+{End}{Delete}"
  ^u::Send "+{Home}{BackSpace}"
}

; OUTLOOK
#HotIf WinActive("ahk_exe outlook.exe")
{
  !Enter::^Enter
  !1::^1
  !2::^2
  !3::^3
  !4::^4
  !5::^5
  !6::^6
  !7::^7
  !8::^8
  !9::^9
  !0::^0
  !=::^=
  !-::^-
}