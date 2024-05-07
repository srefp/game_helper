InstallKeybdHook
InstallMouseHook

^XButton2:: ; shift + 左上侧键
{
    while GetKeyState("XButton2") ; 如果键为按下的状态则进入循环
    {
        Send "{Click left}" ; 单击左键
        Sleep 100 ; 等0.1s
    }
}

XButton1:: ; 左下侧键
{
    while GetKeyState("XButton1", "P") ; 如果键为按下的状态则进入循环
    {
        SendInput "f" ; 单击f
        Send "{WheelDown}"
        Sleep 80 ; 等80ms
    }
}
