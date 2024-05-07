InstallKeybdHook
InstallMouseHook

; 快速捡东西
XButton1::
{
    while GetKeyState("XButton1", "P")
    {
        SendInput "f"
        Send "{WheelDown}"
        Sleep 60
    }
}

; 快速传送
XButton2::
{
    MouseGetPos &xpos, &ypos
    Send "{Click}"
    Sleep(90)
    DllCall("SetCursorPos", "int", 1678 + Random(-2, 2), "int", 1005 + Random(-2, 2))
    Send "{Click}"
    Sleep(80)
    MouseMove xpos, ypos
}
