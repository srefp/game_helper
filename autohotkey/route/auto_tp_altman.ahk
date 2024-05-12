#HotIf WinActive("ahk_class UnityWndClass") ; 仅在Unity类游戏生效
InstallKeybdHook
InstallMouseHook

SetDefaultMouseSpeed 16

; 路线开始的点位 - 1
global routeIndex := 0

; 常量

; 延时
global BUTTON_SLEEP := 60 ; 点击按钮的延时

; 路线
global routes := [
    {row: 11, column: 1, x: 790, y: 474, crusade: true}, ; 1
    {row: 11, column: 1, x: 920, y: 472, selectX: 1345, selectY: 733}, ; 2
    {row: 11, column: 1, x: 908, y: 542, selectX: 1345, selectY: 733}, ; 3
    {row: 11, column: 1, x: 908, y: 542, selectX: 1345, selectY: 733}, ; 3
]

Right::
{
    global routeIndex, routes
    if (routeIndex >= 0 && routeIndex <= routes.Length) {
        routeIndex++
    }
    if (routeIndex > 0 && routeIndex <= routes.Length) {
        executeStep routes[routeIndex]
    }
}

Left::
{
    global routeIndex, routes
    if (routeIndex > 0 && routeIndex <= routes.Length + 1) {
        routeIndex--
    }
    if (routeIndex > 0 && routeIndex <= routes.Length) {
        executeStep routes[routeIndex]
    }
}

; 上一次追踪的怪
global prevMonster := {row: 0, column: 0}

; 执行每一步
executeStep(step) {
    global prevMonster

    ; 获取值
    crusade := false
    movX := 0
    movY := 0
    selectX := 0
    selectY := 0
    wait := 0

    if (HasProp(step, "crusade") = true) {
        crusade := step.crusade
    }
    if (HasProp(step, "movX")) {
        movX := step.movX
    }
    if (HasProp(step, "movY")) {
        movY := step.movY
    }
    if (HasProp(step, "selectX")) {
        selectX := step.selectX
    }
    if (HasProp(step, "selectY")) {
        selectY := step.selectY
    }
    if (HasProp(step, "wait")) {
        wait := step.wait
    }

    x := step.x
    y := step.y
    row := step.row
    column := step.column

    ; 开书
    Send "{F1}"
    Sleep 600

    ; 点击讨伐
    if (crusade = true) {
        DllCall("SetCursorPos", "int", 294, "int", 545)
        Send "{Click}"
        Sleep 200
    }

    DllCall("SetCursorPos", "int", 956, "int", 283) ; 清空滚轮
    SendInput "{LButton down}"
    Sleep 60
    SendInput "{LButton up}"
    wheel := (row - 1) * 9
    LOOP wheel {
        Send "{WheelDown}"
    }
    Sleep 100

    map := [500, 680, 860]
    monsterPosX := map[column]
    DllCall("SetCursorPos", "int", monsterPosX, "int", 350)
    Send "{Click}"
    Sleep 60

    ; 追踪怪
    DllCall("SetCursorPos", "int", 1460, "int", 840)
    if (prevMonster.row = row && prevMonster.column = column) {
        Send "{Click}"
        Sleep 60
        Send "{Click}"
        Sleep 500
    } else {
        Send "{Click}"
        Sleep 500
        prevMonster.row := row
        prevMonster.column := column
    }

    ; 拖动
    if (movX != 0 || movY != 0) {
        MouseGetPos &xpos, &ypos
        SendEvent "{Click " . xpos . " " . ypos . " Down}{Click " . xpos + movX . " " . ypos + movY . " Up}"
        Sleep BUTTON_SLEEP
    }

    ; 点击传送锚点
    DllCall("SetCursorPos", "int", x, "int", y)
    Send "{Click}"

    if (wait != 0) {
        Sleep wait
    } else if (selectX != 0 && selectY != 0) {
        Sleep 500
    } else {
        Sleep BUTTON_SLEEP
    }

    if (selectX != 0 && selectY != 0) {
        DllCall("SetCursorPos", "int", selectX, "int", selectY)
        Send "{Click}"
        Sleep 160
    }

    ; 确认传送
    DllCall("SetCursorPos", "int", 1678, "int", 1005)
    Send "{Click}"
    Sleep BUTTON_SLEEP
}

; 快速捡东西，按后退键开始咔咔乱捡，再次按后退键停止捡
XButton1::
{
    Sleep 500
    autoPick := true
    while autoPick
    {
        SendInput "f"
        Send "{WheelDown}"
        Loop 5 {
            Sleep 1
            if (GetKeyState("XButton1", "P") || GetKeyState("Shift", "P") || GetKeyState("Enter", "P") || GetKeyState("Esc", "P") || GetKeyState("Alt", "P")) {
                autoPick := false
                break
            }
        }
    }
}

; 快速传送，按前进键直接传送
XButton2::
{
    Send "{Click}"
    Sleep 90
    MouseGetPos &xpos, &ypos
    DllCall("SetCursorPos", "int", 1678 + Random(-2, 2), "int", 1005 + Random(-2, 2))
    Send "{Click}"
    Sleep 80
    DllCall("SetCursorPos", "int", xpos, "int", ypos)
}

; 显示当前坐标
Up::
{
    MouseGetPos &xpos, &ypos
    ToolTip "" . xpos . ", " . ypos
}
