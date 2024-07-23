#HotIf WinActive("ahk_class UnityWndClass") ; 仅在Unity类游戏生效

; 成男成女：1
; 少年: 2
global kind := 2

; 冲刺脚本
run() {
    if (kind = 1) {
        ; 成男成女
        while GetKeyState("RButton", "P") {
            Send "{Click Right}"
            Sleep 810
        }
    } else if (kind = 2) {
        while GetKeyState("RButton", "P") {
            ; 冲刺两下
            Loop 2 {
                if (!GetKeyState("RButton", "P")) {
                    break
                }
                Send "{Click Right}"
                Sleep 400
            }

            ; 跳5次
            Loop 5 {
                if (!GetKeyState("RButton", "P")) {
                    break
                }
                Send "{Space}"
                Sleep 580
            }
        }
    }
}

RButton::run()
