tip(tipText, delay) {
    ToolTip tipText
    SetTimer () => ToolTip(), -delay
}

op(type, pos, delay) {
    if (type = "click") {
        DllCall("SetCursorPos", "int", pos[1], "int", pos[2])
        Send "{Click}"
        Sleep delay
    } else if (type = "move") {
        DllCall("SetCursorPos", "int", pos[1], "int", pos[2])
        Sleep delay
    }
}
