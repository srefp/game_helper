#HotIf WinActive("ahk_class UnityWndClass") ; 仅在Unity类游戏生效

; 成男成女：1
; 少年: 2
; r5魔术温: 3
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
                Send "{Click Right}"
                Sleep 400
            }

            ; 跳3次
            Loop 5 {
                Send "{Space}"
                Sleep 580
            }
        }
    } else if (kind = 3) {
        while GetKeyState("RButton", "P") {
            ; 冲刺两下
            Loop 2 {
                Send "{Click Right}"
                Sleep 400
            }

            ; 跳3次
            Loop 5 {
                Send "{Space}"
                Sleep 580
            }
        }
    }
}

RButton::run()
