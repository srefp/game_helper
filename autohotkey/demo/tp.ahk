#Include constants.ahk

; 执行每一步
executeStep(steps) {
    For _, step in steps {
        type := step.type
        data := step.data
        if (type = MOVE_CLICK) {
            DllCall("SetCursorPos", "int", data.x, "int", data.y)
            Send "{Click}"
            Sleep BUTTON_SLEEP
        } else if (type = DRAG) {
            MouseGetPos &xpos, &ypos
            SendEvent "{Click " . xpos . " " . ypos . " Down}{Click " . xpos - data.x . " " . ypos - data.y . " Up}"
            Sleep BUTTON_SLEEP
        } else if (type = KEYBOARD) {
            Send data
            Sleep 1000
        } else if (type = MOVE) {
            DllCall("SetCursorPos", "int", data.x, "int", data.y)
        } else if (type = WHEEL_DOWN) {
            if (data > 0) {
                LOOP data {
                    Send "{WheelDown}"
                }
            } else {
                LOOP -data {
                    Send "{WheelUp}"
                }
            }
            Sleep BUTTON_SLEEP
        } else if (type = MOVE_CLICK_BOOK) {
            DllCall("SetCursorPos", "int", data.x, "int", data.y)
            Send "{Click}"
            Sleep BUTTON_SLEEP_BOOK
        } else if (type = SHIFT) {
            SendInput "{LShift down}"
            Sleep 80
            SendInput "{LShift up}"
            Sleep BUTTON_SLEEP_BOOK
        }
    }
}