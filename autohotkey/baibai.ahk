InstallKeybdHook
InstallMouseHook

global autopick := false

; 快速捡东西，按后退键开始咔咔乱捡，再次按后退键停止捡
XButton1::
{
    Sleep 500
    while true
    {
        SendInput "f"
        Send "{WheelDown}"
        Sleep 60
        if (GetKeyState("XButton1", "P") || GetKeyState("Shift", "P")) {
            break
        }
    }
}

; 快速传送，按前进键直接传送
XButton2::
{
    MouseGetPos &xpos, &ypos
    Send "{Click}"
    Sleep 90
    DllCall("SetCursorPos", "int", 1678 + Random(-2, 2), "int", 1005 + Random(-2, 2))
    Send "{Click}"
    Sleep 80
    MouseMove xpos, ypos
}
