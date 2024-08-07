tip(tipText, delay) {
    ToolTip tipText
    SetTimer () => ToolTip(), -delay
}

op(type, params, delay) {
    if (type = "click") {
        lPos := [params[1], params[2]]
        pPos := physicalPos(lPos)

        DllCall("SetCursorPos", "int", pPos[1], "int", pPos[2])
        Send "{Click}"
        Sleep delay
    } else if (type = "move") {
        lPos := [params[1], params[2]]
        pPos := physicalPos(lPos)

        DllCall("SetCursorPos", "int", pPos[1], "int", pPos[2])
        Sleep delay
    } else if (type = "drag") {
        start := physicalPos([params[1], params[2]])
        end := physicalPos([params[3], params[4]])

        DllCall("SetCursorPos", "int", start[1], "int", start[2])
        SendEvent "{Click " . start[1] . " " . start[2] . " Down}{Click " . end[1] . " " . end[2] . " Up}"
    } else if (type = "longClick") {
        lPos := [params[1], params[2]]
        pPos := physicalPos(lPos)

        DllCall("SetCursorPos", "int", pPos[1], "int", pPos[2])
        Send "{LButton down}"
        Sleep CLICK_DOWN_SLEEP
        Send "{LButton up}"
    }
}

logicalPos() {
    MouseGetPos &xpos, &ypos
    screenWidth := A_ScreenWidth
    screenHeight := A_ScreenHeight

    maxX := screenWidth - 1
    maxY := screenHeight - 1

    return [Round(xpos * 65535 / maxX), Round(ypos * 65535 / maxY)]
}

physicalPos(lPos) {
    screenWidth := A_ScreenWidth
    screenHeight := A_ScreenHeight

    maxX := screenWidth - 1
    maxY := screenHeight - 1

    return [Round(lPos[1] * maxX / 65535), Round(lPos[2] * maxY / 65535)]
}
