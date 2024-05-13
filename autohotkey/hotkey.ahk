; 后面的参数不用修改
global crusadePos := [294, 545] ; 讨伐按钮的位置
global clearWheelPos := [956, 283] ; 清空滚轮的位置
global monsterColumnPos := [500, 680, 860] ; 三列怪的不同x值
global monsterRowPos := 350 ; 怪的y值
global rowWheelNum := 9 ; 滚动一行需要的滚轮数
global trackMonsterPos := [1460, 840] ; 追踪怪的位置
global confirmPos := [1678, 1005] ; 确认按钮的位置
global selection := [[1370, 734]] ; 点击锚点时多选按钮的位置

screenWidth := A_ScreenWidth
screenHeight := A_ScreenHeight

global SCREEN

if (screenWidth = 1920 && screenHeight = 1080) {
    SCREEN := "1080P"
    ToolTip "当前为1080P的屏幕，已为您自动切换到1080P自动传送！"
} else if (screenWidth = 2560 && screenHeight = 1440) {
    SCREEN := "2K"
    ToolTip "当前为2K的屏幕，已为您自动切换到2K自动传送！"
} else {
    ToolTip "未检测到您当前的屏幕分辨率，或暂不支持您的屏幕分辨率。"
}
SetTimer () => ToolTip(), -2000

if (SCREEN = "2K") {
    crusadePos := [396, 730]
    clearWheelPos := [1274, 382]
    monsterColumnPos := [660, 900, 1140]
    monsterRowPos := 460
    rowWheelNum := 9
    trackMonsterPos := [1913, 1120]
    confirmPos := [2255, 1347]
    selection := [[1908, 976]]
}

global BUTTON_SLEEP := 60 ; 点击按钮的延时
SetDefaultMouseSpeed 16 ; 拖动地图时的鼠标移速
#HotIf WinActive("ahk_class UnityWndClass") ; 仅在Unity类游戏生效
InstallKeybdHook
InstallMouseHook
ProcessSetPriority "High" ; 高优先模式
global quickPickPause := false
global crusade := true

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
    global crusade

    ; 暂停快捡
    quickPickPause := true

    ; 获取值
    movX := 0
    movY := 0
    selectX := 0
    selectY := 0
    wait := 0

    is2K := SCREEN = "2K"

    if (is2K) {
        if (HasProp(step, "movX2K")) {
            movX := step.movX2K
        }
    } else if (HasProp(step, "movX")) {
        movX := step.movX
    }
    if (is2K) {
        if (HasProp(step, "movY2K")) {
            movY := step.movY2K
        }
    } else if (HasProp(step, "movY")) {
        movY := step.movY
    }
    if (HasProp(step, "select")) {
        selectX := selection[step.select - 1][1]
        selectY := selection[step.select - 1][2]
    }
    if (HasProp(step, "wait")) {
        wait := step.wait
    }

    if (is2K) {
        x := step.pos2K[1]
        y := step.pos2K[2]
    } else {
        x := step.pos[1]
        y := step.pos[2]
    }

    row := step.monster[1]
    column := step.monster[2]

    sameMonster := prevMonster[1] = row && prevMonster[2] = column

    ; 开书
    Send "{F1}"
    if (sameMonster) {
        Sleep BOOK_SLEEP
    } else {
        Sleep BOOK_SLEEP2
    }

    ; 点击讨伐
    if (crusade) {
        DllCall("SetCursorPos", "int", crusadePos[1], "int", crusadePos[2])
        Send "{Click}"
        Sleep 200
        crusade := false
    }

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
        Sleep 50
        Send "{Click}"
        if (sameMonster) {
            Sleep MAP_SLEEP
        } else {
            Sleep MAP_SLEEP2
        }
    } else {
        Send "{Click}"
        Sleep MAP_SLEEP
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
    DllCall("SetCursorPos", "int", confirmPos[1], "int", confirmPos[2])
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

global debugMode := false

global timingIsStart := true

FileEncoding "UTF-8"

global gamingStartTime := A_Now

; 计时
Down::
{
    global timingIsStart, gamingStartTime
    curTime := A_Now
    curTimeStr := FormatTime(curTime, "yyyy-MM-dd HH:mm:ss")
    if (timingIsStart) {
        gamingStartTime := A_Now
        FileAppend "锄地开始时间：" . curTimeStr . "`n", timingFile
        ToolTip "开始计时!"
    } else {
        FileAppend "锄地结束时间：" . curTimeStr . "`n", timingFile
        seconds := DateDiff(curTime, gamingStartTime, "Seconds")
        minutes := Floor(seconds / 60)
        leftSeconds := Mod(seconds, 60)
        FileAppend "时长：" . minutes . "分钟" . leftSeconds . "秒" . "`n", timingFile
        ToolTip "结束计时!"
    }
    SetTimer () => ToolTip(), -2000

    timingIsStart := !timingIsStart
}

; 显示当前坐标
Up::
{
    if (debugMode) {
        MouseGetPos &xpos, &ypos
        ToolTip "" . xpos . ", " . ypos
    } else {
        global routeIndex, routes
        if (routeIndex = 0) {
            ToolTip "路线未开始。"
        } else if (routeIndex >= routes.Length) {
            ToolTip "路线已结束！"
        } else {
            route := routes[routeIndex]
            if (HasProp(route, "name")) {
                ToolTip "当前是第" . (routeIndex + 1) . "个点位：" . route.name . "。"
            } else {
                ToolTip "当前是第" . (routeIndex + 1) . "个点位。"
            }
        }
        SetTimer () => ToolTip(), -5000
    }
}
