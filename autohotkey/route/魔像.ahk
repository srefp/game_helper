#HotIf WinActive("ahk_class UnityWndClass") ; 仅在Unity类游戏生效
InstallKeybdHook
InstallMouseHook

; 路线开始的点位 - 1
global routeIndex := 0

; 配置项
global SCREEN := "1080P" ; 可选 1080P、2K，默认1080P

global crusadePos := [294, 545] ; 讨伐按钮的位置
global clearWheelPos := [956, 283] ; 清空滚轮的位置
global monsterColumnPos := [500, 680, 860] ; 三列怪的不同x值
global monsterRowPos := 350 ; 怪的y值
global rowWheelNum := 9 ; 滚动一行需要的滚轮数
global trackMonsterPos := [1460, 840] ; 追踪怪的位置
global confirmPos := [1678, 1005] ; 确认按钮的位置
global twoSelection := [1370, 734] ; 二选一按钮的位置

if (SCREEN = "2K") {
}

global BUTTON_SLEEP := 60 ; 点击按钮的延时

; 路线
global routes := [
    {monster: [11, 1], pos: [790, 474]}, ; 1
    {monster: [11, 1], pos: [920, 472], select: twoSelection}, ; 2
    {monster: [11, 1], pos: [908, 542], select: twoSelection}, ; 3
]

SetDefaultMouseSpeed 10
global quickPickPause := false

Right::
{
    global routeIndex, routes
    if (routeIndex >= 0 && routeIndex <= routes.Length) {
        routeIndex++
    }
    if (routeIndex > 0 && routeIndex <= routes.Length) {
        executeStep routes[routeIndex], routeIndex
    }
}

Left::
{
    global routeIndex, routes
    if (routeIndex > 0 && routeIndex <= routes.Length + 1) {
        routeIndex--
    }
    if (routeIndex > 0 && routeIndex <= routes.Length) {
        executeStep routes[routeIndex], routeIndex
    }
}

; 上一次追踪的怪
global prevMonster := [0, 0]

; 执行每一步
executeStep(step, routeIndex) {
    global quickPickPause
    global prevMonster

    ; 暂停快捡
    quickPickPause := true

    ; 获取值
    movX := 0
    movY := 0
    selectX := 0
    selectY := 0
    wait := 0

    if (HasProp(step, "movX")) {
        movX := step.movX
    }
    if (HasProp(step, "movY")) {
        movY := step.movY
    }
    if (HasProp(step, "select")) {
        selectX := step.select[1]
    }
    if (HasProp(step, "select")) {
        selectY := step.select[2]
    }
    if (HasProp(step, "wait")) {
        wait := step.wait
    }

    x := step.pos[1]
    y := step.pos[2]
    row := step.monster[1]
    column := step.monster[2]

    ; 开书
    Send "{F1}"
    Sleep 600

    ; 点击讨伐
    if (routeIndex = 1) {
        DllCall("SetCursorPos", "int", crusadePos[1], "int", crusadePos[2])
        Send "{Click}"
        Sleep 200
    }

    sameMonster := prevMonster[1] = row && prevMonster[2] = column
    if (!sameMonster) {
        DllCall("SetCursorPos", "int", clearWheelPos[1], "int", clearWheelPos[2]) ; 清空滚轮
        SendInput "{LButton down}"
        Sleep 60
        SendInput "{LButton up}"
        wheel := (row - 1) * rowWheelNum
        LOOP wheel {
            Send "{WheelDown}"
        }
        Sleep 100

        map := monsterColumnPos
        monsterPosX := map[column]
        DllCall("SetCursorPos", "int", monsterPosX, "int", monsterRowPos)
        Send "{Click}"
        Sleep 60
    }

    ; 追踪怪
    DllCall("SetCursorPos", "int", trackMonsterPos[1], "int", trackMonsterPos[2])
    if (sameMonster) {
        Send "{Click}"
        Sleep 60
        Send "{Click}"
        Sleep 500
    } else {
        Send "{Click}"
        Sleep 500
        prevMonster[1] := row
        prevMonster[2] := column
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
    MouseGetPos &xpos, &ypos
    Sleep 90
    MouseGetPos &xpos, &ypos
    DllCall("SetCursorPos", "int", confirmPos[1], "int", confirmPos[2])
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
