;; SETTINGS
#SingleInstance Force ; The script will Reload if launched while already running
#InputLevel 0
SendMode("Input")     ; Recommended for new scripts due to its superior speed and reliability

;; GROUPS
; define application groups
GroupAdd "vscodes", "ahk_exe Code.exe"
GroupAdd "vscodes", "ahk_exe VSCodium.exe"
GroupAdd "firefoxes", "ahk_exe firefox.exe"
GroupAdd "chromes", "ahk_exe chrome.exe"
GroupAdd "chromes", "ahk_exe brave.exe"
GroupAdd "chromes", "ahk_exe msedge.exe"
GroupAdd "office", "ahk_exe excel.exe"
GroupAdd "outlook", "ahk_exe msedgewebview2.exe"
GroupAdd "outlook", "ahk_exe outlook.exe"
GroupAdd "outlook", "ahk_exe olk.exe"
GroupAdd "browsers", "ahk_group chromes"
GroupAdd "browsers", "ahk_group firefoxes"
GroupAdd "terminals", "ahk_exe WindowsTerminal.exe"
GroupAdd "notepads", "ahk_exe notepad.exe"
; define functionality groups
GroupAdd "tabsCTab", "ahk_group terminals"
GroupAdd "tabsCTab", "ahk_group notepads"
GroupAdd "tabsCTab", "ahk_group explorer"
GroupAdd "tabsCTab", "ahk_exe KeePass.exe"
GroupAdd "tabsCPgUp", "ahk_group vscodes"
GroupAdd "tabsCPgUp", "ahk_group browsers"
GroupAdd "tabsCPgUp", "ahk_group office"
GroupAdd "explorer", "ahk_class CabinetWClass ahk_exe explorer.exe"
GroupAdd "explorer", "ahk_class WorkerW ahk_exe explorer.exe"
; group used to exclude functionality
; don't forget to exclude games!
GroupAdd "games", "ahk_exe minetest.exe"
GroupAdd "editing", "ahk_class Emacs"
GroupAdd "editing", "ahk_group explorer"
GroupAdd "editing", "ahk_group terminals"
GroupAdd "editing", "ahk_group games"
GroupAdd "editing", "ahk_exe excel.exe"

;; MODIFIERS
; CapsLock? Does someone need it? Easier to reash Escape!
SetCapsLockState "AlwaysOff"
CapsLock::Escape
; Space on tap, Control on hold - more ergonomic copypasting!
*Space::
{
  Send("{Blind}{LCtrl down}")
  return
}
*Space up::
{
  Send("{Blind}{LCtrl up}")
  if (A_PRIORKEY = "Space")
  {
    Send("{Space}")
  }
  return
}

#HotIf not WinActive("ahk_group games")
{
  ;; WORKSPACES
  $^#1::Send("#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}")
  $^#2::Send("#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Right}")
  $^#3::Send("#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Right}#^{Right}")
  $^#4::Send("#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Right}#^{Right}#^{Right}")
  $^#5::Send("#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Right}#^{Right}#^{Right}#^{Right}")
  $^#6::Send("#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}")
  $^#7::Send("#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}")
  $^#8::Send("#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}")
  $^#9::Send("#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}")
  $^#0::Send("#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Left}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}#^{Right}")
  
  ;; WINDOWS
  !q::!F4
  $^#Enter::
  {
    active_id := WinGetID("A")
    MX := WinGetMinMax(active_id )
    if (MX==1)
        WinRestore active_id 
    else if (MX==-1)
        WinRestore active_id 
    else if (MX==0)
        WinMaximize active_id
  }
  #h::WinMinimize "A"
}
; hide all windows except current
!#h::
{
  active_id := WinGetID("A")
  WinMinimizeAll
  WinActivate active_id
}

;; TABS
#HotIf WinActive("ahk_group tabsCPgUp")
{
  !+sc01B::^PgDn
  !+sc01A::^PgUp
  ^Tab::^PgDn
  ^+Tab::^PgUp
}
#HotIf WinActive("ahk_group tabsCTab")
{
  !+sc01B::^Tab
  !+sc01A::^+Tab
  ^PgDn::^Tab
  ^PgUp::^+Tab
}

;; TERMINAL
^!t::Run "wt"
#HotIf WinActive("ahk_group terminals")
{
  !BackSpace::Send "+{Home}{BackSpace}"
  !Delete::Send "+{End}{Delete}"
  ^+v::!+= ; split vertically
  ^+h::!+- ; split horisontally
  ^+s::!+- ; split horisontally
  ; focus panes, like in Konsole
  ^+Left::!Left
  ^+Right::!Right
  ^+Up::!Up
  ^+Down::!Down
}

;; EDITING
#HotIf not WinActive("ahk_group editing")
{
  !Left::Home
  !Right::End
  !Up::^Home
  !Down::^End
  !BackSpace::Send "+{Home}{BackSpace}"
  #BackSpace::Send "^+{Left}{BackSpace}"
  !Delete::Send "+{End}{Delete}"
  #Delete::Send "^+{Right}{Delete}"
  !b::^Left
  !f::^Right
  !d::Send "^+{Right}{Delete}"
}

;; EXPLORER
#HotIf WinActive("ahk_group explorer")
{
  +Enter::F2
  !Down::Enter
  !BackSpace::Delete
  !+BackSpace::+Delete
  !1::^+2 ; Cmd+1: View as Icons
  !2::^+6 ; Cmd+2: View as List (Detailed)
  !3::^+5 ; Cmd+3: View as List (Compact)
  !4::^+1 ; Cmd+4: View as Gallery
  !5::^+7 ; Cmd+5: Back to windows default view
}

;; OTHER, VERY APP SPECIFIC
; open settings
#HotIf WinActive("ahk_group chromes")
{
  ^,::Send "{Ctrl Down}{t}{Ctrl Up}chrome://settings{Enter}"
}
#HotIf WinActive("ahk_group firefoxes")
{
  ^,::Send "{Ctrl Down}{t}{Ctrl Up}about:preferences{Enter}"
}
; excel
#HotIf WinActive("ahk_exe excel.exe")
{
  !BackSpace::Send "+{Home}{BackSpace}"
  #BackSpace::Send "^+{Left}{BackSpace}"
  !Delete::Send "+{End}{Delete}"
  #Delete::Send "^+{Right}{Delete}"
  !b::^Left
  !f::^Right
  !d::Send "^+{Right}{Delete}"
  +Enter::!Enter
}
