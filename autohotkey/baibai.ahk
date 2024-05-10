InstallKeybdHook
InstallMouseHook

; 快速捡东西，按后退键开始咔咔乱捡，再次按后退键停止捡
XButton1::
{
    Sleep 500
    autoPick := true
    while autoPick
    {
        SendInput "f"
        Send "{WheelDown}"
        Loop 5 {
            Sleep 1
            if (GetKeyState("XButton1", "P") || GetKeyState("Shift", "P") || GetKeyState("Enter", "P") || GetKeyState("Esc", "P") || GetKeyState("Alt", "P")) {
                autoPick := false
                break
            }
        }
    }
}

; 快速传送，按前进键直接传送
XButton2::
{
    Send "{Click}"
    Sleep 90
    MouseGetPos &xpos, &ypos
    DllCall("SetCursorPos", "int", 1678 + Random(-2, 2), "int", 1005 + Random(-2, 2))
    Send "{Click}"
    Sleep 80
    DllCall("SetCursorPos", "int", xpos, "int", ypos)
}
