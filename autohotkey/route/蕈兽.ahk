#HotIf WinActive("ahk_class UnityWndClass") ; 仅在Unity类游戏生效
InstallKeybdHook
InstallMouseHook

SetDefaultMouseSpeed 16

; 路线开始的点位 - 1
global routeIndex := 3

; 常量

; 延时
global BUTTON_SLEEP := 60 ; 点击按钮的延时

global quickPickPause := false

; 路线
global routes := [
    {row: 6, column: 3, x: 765, y: 332, crusade: true}, ; 1
    {row: 6, column: 3, x: 772, y: 468}, ; 2
    {row: 6, column: 3, x: 422, y: 693}, ; 3
    {row: 6, column: 3, x: 210, y: 695}, ; 4
    {row: 7, column: 1, x: 921, y: 579, selectX: 1321, selectY: 731}, ; 5
    {row: 7, column: 1, x: 1151, y: 996}, ; 6
    {row: 7, column: 1, x: 1739, y: 869}, ; 7
    {row: 8, column: 2, x: 1737, y: 635}, ; 8
    {row: 8, column: 1, x: 620, y: 157}, ; 9
    {row: 8, column: 2, x: 950, y: 576, selectX: 1321, selectY: 731}, ; 10
    {row: 8, column: 2, x: 345, y: 203}, ; 11
    {row: 8, column: 3, x: 1492, y: 949, wait: 160}, ; 12
    {row: 8, column: 3, x: 1478, y: 336}, ; 13
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
    global quickPickPause
    global prevMonster
    
    ; 暂停快捡
    quickPickPause := true

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
    
    ; 开始快捡
    quickPickPause := false
}

; 快速捡东西，按后退键开始咔咔乱捡，再次按后退键停止捡
XButton1::
{
    Sleep 500
    autoPick := true
    while autoPick
    {
        if (!quickPickPause) {
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
