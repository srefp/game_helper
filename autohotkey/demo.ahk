InstallKeybdHook
InstallMouseHook

#z::Run "https://www.autohotkey.com"

; 热字符串
::ks::开始挑战吧！
::cq::你好，可以打下你家的枫丹传奇吗？
::py::我可以叫下我的朋友一起来打吗？我的朋友有点多，待会你随便挑几个人放进来就行。
::xx::谢谢！

global num := 0

; 全局变量的使用
XButton1::
{
    global num
    SendInput num
    num++
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
