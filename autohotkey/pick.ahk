#HotIf WinActive("ahk_class UnityWndClass") ; 仅在Unity类游戏生效
#Include "./func/base.ahk"

global quickPickMode := false

quickPick() {
    global quickPickMode
    if (quickPickMode) {
        while GetKeyState("f", "P") {
            SendInput "{Blind}f"
            SendInput "{WheelDown}"
            Sleep 5
        }
    } else {
        SendInput "{Blind}f"
    }
}

changePickingMode() {
    global quickPickMode
    quickPickMode := !quickPickMode
    if (quickPickMode) {
        tip("开启快捡", 2000)
    } else {
        tip("关闭快捡", 2000)
    }
}

f::quickPick()
XButton1::changePickingMode()
