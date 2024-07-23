Sleep 3000

Loop 1000000 {
    DllCall("SetCursorPos", "int", 1274, "int", 1176)
    Send "{Click}"
    Sleep 3501
    DllCall("SetCursorPos", "int", 1091, "int", 867)
    Send "{Click}"
    Sleep 4501
}