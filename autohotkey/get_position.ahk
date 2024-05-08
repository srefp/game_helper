InstallKeybdHook
InstallMouseHook

; 获取位置
RButton::
{
    MouseGetPos &xpos, &ypos
    ToolTip "" . xpos . ", " . ypos
}

; 前进
Right::
{
    MouseGetPos &xpos, &ypos
    ToolTip "" . xpos . ", " . ypos
}
