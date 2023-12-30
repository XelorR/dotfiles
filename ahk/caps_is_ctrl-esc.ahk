SetCapsLockState "AlwaysOff"

; When CapsLock is pressed down, act like LControl.
*Capslock::
{
  Send("{Blind}{LControl down}")
  return
}

; When CapsLock is released, if nothing else was pressed then act like Esc.
*Capslock up::
{
  Send("{Blind}{LControl up}")
  if (A_PRIORKEY = "CapsLock")
  {
    Send("{Esc}")
  }
  return
}
