InstallKeybdHook
InstallMouseHook

XButton1:: ; 左下侧键
{
    while GetKeyState("XButton1", "P") ; 如果键为按下的状态则进入循环
    {
        SendInput "f" ; 单击f
        Send "{WheelDown}"
        Sleep 60
    }
}
