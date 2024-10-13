; Left hand

*a::
{
  Send("{Blind}{LWin down}")
  return
}
*a up::
{
  Send("{Blind}{LWin up}")
  if (A_PRIORKEY = "a")
  {
    Send("{a}")
  }
  return
}

*s::
{
  Send("{Blind}{LAlt down}")
  return
}
*s up::
{
  Send("{Blind}{LAlt up}")
  if (A_PRIORKEY = "s")
  {
    Send("{s}")
  }
  return
}

*d::
{
  Send("{Blind}{LCtrl down}")
  return
}
*d up::
{
  Send("{Blind}{LCtrl up}")
  if (A_PRIORKEY = "d")
  {
    Send("{d}")
  }
  return
}

*f::
{
  Send("{Blind}{LShift down}")
  return
}
*f up::
{
  Send("{Blind}{LShift up}")
  if (A_PRIORKEY = "f")
  {
    Send("{f}")
  }
  return
}
