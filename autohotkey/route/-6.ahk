#HotIf WinActive("ahk_class UnityWndClass") ; 仅在Unity类游戏生效
InstallKeybdHook
InstallMouseHook

SetDefaultMouseSpeed 16

; 路线开始的点位 - 1
global routeIndex := 0

; 常量

; 延时
global BUTTON_SLEEP := 60 ; 点击按钮的延时

global quickPickPause := false

; 路线
global routes := [
    {row: 6, column: 1, x: 36, y: 903, movX: 400, crusade: true}, ; 1
    {row: 6, column: 1, x: 563, y: 202}, ; 2
    {row: 6, column: 1, x: 1536, y: 241}, ; 3
    {row: 6, column: 1, x: 1500, y: 571}, ; 4
    {row: 6, column: 1, x: 792, y: 1056, movY: -100}, ; 5
    {row: 6, column: 2, x: 1053, y: 264}, ; 6 -> 层岩
    {row: 6, column: 2, x: 1065, y: 498}, ; 7
    {row: 6, column: 2, x: 1065, y: 498}, ; 8
    {row: 6, column: 2, x: 1140, y: 899}, ; 9
    {row: 6, column: 2, x: 1216, y: 1048, movX: -400}, ; 10
    {row: 10, column: 2, x: 1044, y: 807}, ; 11 -> 枫丹
    {row: 10, column: 2, x: 1044, y: 807}, ; 12
    {row: 10, column: 2, x: 1147, y: 955}, ; 13
    {row: 9, column: 2, x: 1275, y: 265}, ; 14
    {row: 10, column: 3, x: 683, y: 461}, ; 15
    {row: 10, column: 3, x: 961, y: 648}, ; 16
    {row: 10, column: 3, x: 1590, y: 442}, ; 17
    {row: 7, column: 1, x: 1315, y: 1019, wait: 100}, ; 18 -> 须弥鸡哥
    {row: 7, column: 1, x: 921, y: 579, selectX: 1321, selectY: 731}, ; 19
    {row: 7, column: 1, x: 6, y: 605}, ; 20
    {row: 7, column: 1, x: 94, y: 800}, ; 21
    {row: 7, column: 1, x: 851, y: 948}, ; 22
    {row: 8, column: 1, x: 1186, y: 242}, ; 23
    {row: 7, column: 2, x: 650, y: 593}, ; 24
    {row: 7, column: 2, x: 1190, y: 223}, ; 25
    {row: 7, column: 2, x: 1229, y: 32}, ; 26
    {row: 4, column: 3, x: 793, y: 720}, ; 27
    {row: 4, column: 1, x: 1504, y: 503, selectX: 1370, selectY: 734}, ; 28
    {row: 5, column: 2, x: 954, y: 597}, ; 29
    ; 带传奇
    {row: 9, column: 1, x: 1460, y: 430}, ; 30
    {row: 10, column: 3, x: 1195, y: 420}, ; 31 龙蜥
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
    global routeIndex
    routeIndex++

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
