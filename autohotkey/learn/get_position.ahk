InstallKeybdHook
InstallMouseHook

; 获取位置
RButton::
{
    MouseGetPos &xpos, &ypos
    ToolTip "" . xpos . ", " . ypos
}

; 前进
XButton1::
{
    SendInput "{LShift down}"
    Sleep 80
    SendInput "{LShift up}"
}
