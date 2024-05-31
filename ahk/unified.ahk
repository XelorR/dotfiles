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
GroupAdd "extendedEditingCapabilities", "ahk_group notepads"
GroupAdd "extendedEditingCapabilities", "ahk_group terminals"
GroupAdd "history", "ahk_group browsers"
GroupAdd "history", "ahk_group explorer"
GroupAdd "tabsCTab", "ahk_group terminals"
GroupAdd "tabsCTab", "ahk_group notepads"
GroupAdd "tabsCTab", "ahk_group explorer"
GroupAdd "tabsCTab", "ahk_exe KeePass.exe"
GroupAdd "tabsCPgUp", "ahk_group vscodes"
GroupAdd "tabsCPgUp", "ahk_group browsers"
GroupAdd "tabsCPgUp", "ahk_group office"

; group used to exclude functionality
GroupAdd "completelyExclude", "ahk_class Emacs"

GroupAdd "excludeTerminalsFilemanagers", "ahk_group terminals"
GroupAdd "excludeTerminalsFilemanagers", "ahk_group explorer"
GroupAdd "excludeTerminalsFilemanagers", "ahk_group completelyExclude"

GroupAdd "excludeTerminalsFilemanagers_binds", "ahk_group terminals"
GroupAdd "excludeTerminalsFilemanagers_binds", "ahk_group explorer"
GroupAdd "excludeTerminalsFilemanagers_binds", "ahk_group completelyExclude"
GroupAdd "excludeTerminalsFilemanagers_binds", "ahk_group vscodes"

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
#HotIf not WinActive("ahk_group excludeTerminalsFilemanagers_binds")
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
; exclude file managers
#HotIf not WinActive("ahk_group explorer")
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
; exclude file managers
#HotIf not WinActive("ahk_group explorer")
{
  !BackSpace::Send "+{Home}{BackSpace}"
  !Delete::Send "+{End}{Delete}"
  #BackSpace::Send "^+{Left}{BackSpace}"
  #Delete::Send "^+{Right}{Delete}"
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
  !BackSpace::Send "+{Home}{BackSpace}"
  ^p::Up
  ^n::Down
  ^f::Right
  ^b::Left
  ^a::Home
  ^e::End
  ^d::Delete
  !,::^,
  ^+9::!+=
  ^+0::!+-
  ^+Left::!Left
  ^+Right::!Right
  ^+Up::!Up
  ^+Down::!Down
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
#HotIf WinActive("ahk_group extendedEditingCapabilities")
{
  #f::^Right
  #b::^Left
  #d::Send "^+{Right}{Delete}"
  ^w::Send "^+{Right}{Delete}"
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