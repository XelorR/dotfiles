SetCapsLockState "AlwaysOff"

CapsLock::Esc
LAlt::LWin
LWin::LAlt
LControl::Send "{LWin Down}{Space Down}{Space Up}{LWin Up}"

; SPACE as CONTROL on hold
*Space::
{
  Send("{Blind}{RControl down}")
  return
}
*Space up::
{
  Send("{Blind}{RControl up}")
  if (A_PRIORKEY = "Space")
  {
    Send("{Space}")
  }
  return
}

