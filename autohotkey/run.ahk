#HotIf WinActive("ahk_class UnityWndClass") ; 仅在Unity类游戏生效

; 冲刺脚本
run() {
    while GetKeyState("RButton", "P") {
        Send "{Click Right}"
        Sleep 810
    }
}

RButton::run()
