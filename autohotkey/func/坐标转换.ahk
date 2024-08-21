Up::convert()

convert() {
    Send "^c"
    Sleep 200  ; 等待剪贴板中出现文本.
    posText := A_Clipboard

    index := 1
    pPos := [0, 0]
    Loop Parse posText, ","
    {
        pPos[index++] := A_LoopField
    }

    screenWidth := 1920
    screenHeight := 1080

    maxX := screenWidth - 1
    maxY := screenHeight - 1

    lPos :=  [Round(pPos[1] * 65535 / maxX), Round(pPos[2] * 65535 / maxY)]

    A_Clipboard := lPos[1] . ", " . lPos[2]
    Sleep 200
    Send "^v"
}