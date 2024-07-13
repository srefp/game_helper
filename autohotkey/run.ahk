; 冲刺脚本
run() {
    while GetKeyState("RButton", "P") {
        Send "{Click Right}"
        Sleep 810
    }
}

RButton::run()
