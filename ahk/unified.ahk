SetCapsLockState "AlwaysOff"
CapsLock::Escape

; LETTERS
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
; close window
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
; new
!+n::^+n
; optional open
!+o::^+o
; cmd-shift-p
!+p::^+p
!+q::!+q
; refresh
!+r::^+r
; save as
!+s::^+s
; restore tab
!+t::^+t
!+u::!+u
!+v::!+v
!+w::!+w
!+x::!+x
!+y::!+y
; redo
!+z::^y

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
^!t::^!t
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

; TABS
!+sc01B::^PgDn
!+sc01A::^PgUp

; HISTORY
!sc01B::!Right
!sc01A::!Left

; DELETION
!Backspace::Send("{Shift Down}{Home}{Shift Up}{Backspace}")
^k::Send("{Shift Down}{End}{Shift Up}{Delete}")

; ARROWS
!Left::Home
!Right::End
!Up::^home
!Down::^end
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

; LAUNCHER
!Space::#s

; OPEN SETTINGS
GroupAdd "chromes", "ahk_exe brave.exe"
GroupAdd "chromes", "ahk_exe chrome.exe"
GroupAdd "chromes", "ahk_exe msedge.exe"
GroupAdd "firefoxes", "ahk_exe firefox.exe"
#HotIf WinActive("ahk_group chromes")
{
  !,::Send "{Ctrl Down}{t}{Ctrl Up}chrome://settings{Enter}"
}
#HotIf WinActive("ahk_group firefoxes")
{
  !,::Send "{Ctrl Down}{t}{Ctrl Up}about:preferences{Enter}"
}

; TEXT EDITORS
GroupAdd "vscodes", "ahk_exe Code.exe"
#HotIf WinActive("ahk_group vscodes")
{
  #up::!up
  #!up::#!up
  #+up::#+up
  #down::!down
  #!down::#!down
  #+down::#+down
  #z::!z
  !Enter::^Enter
  !,::^,
}