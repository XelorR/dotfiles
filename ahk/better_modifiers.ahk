SetCapsLockState "AlwaysOff"

;; To be used with laptop keyboard when QMK keyboard is not connected
;; (it simalates my QMK config)

; CAPS as both CONTROL and ESCAPE
*Capslock::
{
  Send("{Blind}{LControl down}")
  return
}

*Capslock up::
{
  Send("{Blind}{LControl up}")
  if (A_PRIORKEY = "CapsLock")
  {
    Send("{Esc}")
  }
  return
}

; SPACE as ALT on hold
*Space::
{
  Send("{Blind}{LAlt down}")
  return
}

*Space up::
{
  Send("{Blind}{LAlt up}")
  if (A_PRIORKEY = "Space")
  {
    Send("{Space}")
  }
  return
}

; LEFT ALT as COMMAND --- simulating macos-like Command+letter shortcuts
*LAlt::
{
  Send("{Blind}{RCtrl down}")
  return
}

*LAlt up::
{
  Send("{Blind}{RCtrl up}")
  if (A_PRIORKEY = "LAlt")
  {
    Send("{LAlt}")
  }
  return
}

; RIGHT ALT to switch layout on tap
*RAlt::
{
  Send("{Blind}{RAlt down}")
  return
}

*RAlt up::
{
  Send("{Blind}{RAlt up}")
  if (A_PRIORKEY = "RAlt")
  {
    Send("{LWin Down}{Space Down}{Space Up}{LWin Up}")
  }
  return
}

; ENTER as RIGHT SHIFT on hold --- sometimes I accidentaly hold it instead of RIGHT SHIFT
*Enter::
{
  Send("{Blind}{RShift down}")
  return
}

*Enter up::
{
  Send("{Blind}{RShift up}")
  if (A_PRIORKEY = "Enter")
  {
    Send("{Enter}")
  }
  return
}
