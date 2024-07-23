#HotIf WinActive("ahk_class UnityWndClass") ; 仅在Unity类游戏生效

; 成男成女：1
; 少年: 2
; r5魔术温: 3
global kind := 1

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
                Sleep 200
            }

            ; 跳3次
            Loop 3 {
                Send "{Click Right}"
                Send "{Space}"
                Sleep 500
            }
        }
    } else if (kind = 3) {
        while GetKeyState("RButton", "P") {
            ; 冲刺两下
            Loop 2 {
                Send "{Click Right}"
                Sleep 200
            }

            ; 跳3次
            Loop 3 {
                Send "{Click Right}"
                Send "{Space}"
                Sleep 500
            }
        }
    }
}

RButton::run()
