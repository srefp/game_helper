; 后面的参数不用修改
global crusadePos := [294, 545] ; 讨伐按钮的位置
global clearWheelPos := [956, 283] ; 清空滚轮的位置
global monsterColumnPos := [500, 680, 860] ; 三列怪的不同x值
global monsterRowPos := 350 ; 怪的y值
global rowWheelNum := 9 ; 滚动一行需要的滚轮数
global trackMonsterPos := [1460, 840] ; 追踪怪的位置
global confirmPos := [1678, 1005] ; 确认按钮的位置
global selection := [[1370, 734]] ; 点击锚点时多选按钮的位置
global foodPos := []
global narrowPos := [88, 1300]
global enlargePos := [88, 854]

screenWidth := A_ScreenWidth
screenHeight := A_ScreenHeight

global SCREEN

if (screenWidth = 1920 && screenHeight = 1080) {
    SCREEN := "1080P"
    ToolTip "当前为1080P的屏幕，已为您自动切换到1080P自动传送！"
} else if (screenWidth = 2560 && screenHeight = 1440) {
    SCREEN := "2K"
    ToolTip "当前为2K的屏幕，已为您自动切换到2K自动传送！"
} else if (screenWidth = 2560 && screenHeight = 1600) {
    SCREEN := "25K"
    ToolTip "当前为2.5K的屏幕，已为您自动切换到2.5K自动传送！"
} else if (screenWidth = 3840 && screenHeight = 2160) {
    SCREEN := "4K"
    ToolTip "当前为4K的屏幕，已为您自动切换到4K自动传送！"
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
    foodPos := [1149, 69]
}

if (SCREEN = "25K") {
    crusadePos := [393, 800]
    clearWheelPos := [1274, 461]
    monsterColumnPos := [660, 900, 1140]
    monsterRowPos := 544
    rowWheelNum := 9
    trackMonsterPos := [1909, 1201]
    confirmPos := [2238, 1497]
    selection := [[1858, 1134]]
    foodPos := []
}

if (SCREEN = "4K") {
    crusadePos := [579, 1095]
    clearWheelPos := [1911, 568]
    monsterColumnPos := [1010, 1350, 1720]
    monsterRowPos := 690
    rowWheelNum := 9
    trackMonsterPos := [2895, 1688]
    confirmPos := [3371, 2017]
    selection := [[2727, 1468]]
    foodPos := [1726, 102]
    narrowPos := [88, 1300]
    enlargePos := [88, 854]
}

global BUTTON_SLEEP := 60 ; 点击按钮的延时
global BOOK_SLEEP := 450 ; 不跨怪开书等待时间
global BOOK_SLEEP2 := 600 ; 跨怪开书等待时间
global BOOK_SLEEP3 := 600 ; 首次开书等待时间
global MAP_SLEEP := 300 ; 不跨怪Map等待时间
global MAP_SLEEP2 := 350 ; 跨怪Map等待时间
global CANCEL_AND_CLICK_SLEEP := 50 ; 取消后再次点击的等待时间
global CRUSADE_SLEEP := 200 ; 点击讨伐后的等待时间
global CLICK_DOWN_SLEEP := 60 ; 长按鼠标的等待时间
global WHEEL_SLEEP := 100 ; 选怪时滚轮滚动等待时间
global SELECT_TWO_WAIT_SLEEP := 500 ; 锚点双选时的等待时间
global SELECT_TWO_CLICK_SLEEP := 160 ; 锚点双选时点击后的等待时间
global DIRECT_TP_SLEEP := 90 ; 快传等待时间
global DIRECT_TP_BAG_SLEEP := 80 ; 快传复位等待时间
global QUICK_PICK_SLEEP := 5 ; 快检等待时间，5不意味着5ms！！！
global BAG_SLEEP := 500 ; 开背包的延迟

SetDefaultMouseSpeed 16 ; 拖动地图时的鼠标移速

; 关闭进程名为Snipaste.exe的程序
ProcessClose "Snipaste.exe"

#HotIf WinActive("ahk_class UnityWndClass") ; 仅在Unity类游戏生效
InstallKeybdHook
InstallMouseHook
ProcessSetPriority "Low" ; 低优先模式
global quickPickPause := false
global crusade := true

global tpForbidden := false
global fastMode := false
global qmMode := false

; 上一次追踪的怪
global prevMonster := [0, 0]

; 传送至下一个点位
tpNext() {
    global tpForbidden
    if (tpForbidden) {
        return
    }
    tpForbidden := true
    global routeIndex, routes
    if (routeIndex >= 0 && routeIndex <= routes.Length) {
        routeIndex++
    }
    if (routeIndex > 0 && routeIndex <= routes.Length) {
        executeStep routes[routeIndex], routeIndex
    }
    SetTimer () => tpForbidden := false , -5000
}

; 传送至上一个点位
tpPrev() {
    if (tpForbidden) {
        return
    }
    global routeIndex, routes
    if (routeIndex > 0 && routeIndex <= routes.Length + 1) {
        routeIndex--
        if (routeIndex = 0) {
            routeIndex := routes.Length
        }
    }
    if (routeIndex > 0 && routeIndex <= routes.Length) {
        executeStep routes[routeIndex], routeIndex
    }
    SetTimer () => tpForbidden := false , -8000
}

; 执行每一步
executeStep(step, routeIndex) {
    global quickPickPause
    global prevMonster
    global crusade
    global fastMode
    global qmMode

    ; 暂停快捡
    quickPickPause := true

    ; 获取值
    movX := 0
    movY := 0
    selectX := 0
    selectY := 0
    wait := 0
    selectionWait := 0
    qm := true
    wheel := 0
    x := 0
    y := 0
    narrow := 0
    pointFast := false

    is2K := SCREEN = "2K"
    is25K := SCREEN = "25K"
    is4K := SCREEN = "4K"

    ; 记录开图总时间
    sum := 0

    if (is2K) {
        if (HasProp(step, "movX2K")) {
            movX := step.movX2K
        }
    } else if (is25K) {
        if (HasProp(step, "movX25K")) {
            movX := step.movX25K
        }
    } else if (HasProp(step, "movX")) {
        movX := step.movX
    }
    if (is2K) {
        if (HasProp(step, "movY2K")) {
            movY := step.movY2K
        }
    } else if (is25K) {
        if (HasProp(step, "movY25K")) {
            movY := step.movY25K
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
    if (HasProp(step, "selectionWait")) {
        selectionWait := step.selectionWait
    }
    if (HasProp(step, "qm")) {
        qm := step.qm
    }
    if (HasProp(step, "narrow")) {
        narrow := step.narrow
    }

    if (is2K) {
        if (fastMode && HasProp(step, "fastPos2K")) {
            x := step.fastPos2K[1]
            y := step.fastPos2K[2]
            pointFast := true
        } else {
            x := step.pos2K[1]
            y := step.pos2K[2]
        }
    } else if (is25K) {
        if (fastMode && HasProp(step, "fastPos25K")) {
            x := step.fastPos25K[1]
            y := step.fastPos25K[2]
            pointFast := true
        } else {
            x := step.pos25K[1]
            y := step.pos25K[2]
        }
    } else if (is4K) {
        if (fastMode && HasProp(step, "fastPos4K")) {
            x := step.fastPos4K[1]
            y := step.fastPos4K[2]
            pointFast := true
        } else {
            x := step.pos4K[1]
            y := step.pos4K[2]
        }
    } else {
         if (fastMode && HasProp(step, "fastPos")) {
             x := step.fastPos[1]
             y := step.fastPos[2]
             pointFast := true
         } else {
             x := step.pos[1]
             y := step.pos[2]
         }
     }

    if (fastMode && pointFast && HasProp(step, "fastWheel")) {
        wheel := step.fastWheel
    } else if (!pointFast && HasProp(step, "wheel")) {
        wheel := step.wheel
    }

    row := step.monster[1]
    column := step.monster[2]

    sameMonster := prevMonster[1] = row && prevMonster[2] = column

    ; 开书
    ; 开书前开大招
    if (qmMode && qm) {
        Send "{Blind}w"
        Click "Right"
        Sleep 50
        Send "{Blind}q"
        Sleep 10
    }

    if (fastMode && pointFast) {
        Send "{LShift down}"
        Sleep 500
        Send "{LShift up}"
    } else {
        Send "{F1}"
        if (crusade) {
            Sleep BOOK_SLEEP3
            sum += BOOK_SLEEP3
        } else if (sameMonster) {
            Sleep BOOK_SLEEP
            sum += BOOK_SLEEP
        } else {
            Sleep BOOK_SLEEP2
            sum += BOOK_SLEEP2
        }

        ; 点击讨伐
        if (crusade) {
            op("click", crusadePos, CRUSADE_SLEEP)
            sum += CRUSADE_SLEEP
            crusade := false
        }

        if (!sameMonster) {
            DllCall("SetCursorPos", "int", clearWheelPos[1], "int", clearWheelPos[2]) ; 清空滚轮
            Send "{LButton down}"
            Sleep CLICK_DOWN_SLEEP
            sum += CLICK_DOWN_SLEEP
            Send "{LButton up}"
            monsterWheel := (row - 1) * rowWheelNum
            LOOP monsterWheel {
                Send "{WheelDown}"
            }
            Sleep WHEEL_SLEEP
            sum += WHEEL_SLEEP

            map := monsterColumnPos
            monsterPosX := map[column]
            op("click", [monsterPosX, monsterRowPos], BUTTON_SLEEP)
            sum += BUTTON_SLEEP
        }

        ; 追踪怪
        DllCall("SetCursorPos", "int", trackMonsterPos[1], "int", trackMonsterPos[2])
        if (sameMonster) {
            Send "{Click}"
            Sleep CANCEL_AND_CLICK_SLEEP
            sum += CANCEL_AND_CLICK_SLEEP
            Send "{Click}"
            Sleep MAP_SLEEP
            sum += MAP_SLEEP
        } else {
            Send "{Click}"
            Sleep MAP_SLEEP2
            sum += MAP_SLEEP2
            prevMonster[1] := row
            prevMonster[2] := column
        }
    }

    ; 缩小
    if (narrow != 0) {
        if (narrow > 0) {
            Loop narrow {
                op("click", narrowPos, 5)
            }
        } else {
            Loop -narrow {
                op("click", enlargePos, 5)
            }
        }

    }

    ; 拖动
    if (movX != 0 || movY != 0) {
        MouseGetPos &xpos, &ypos
        SendEvent "{Click " . xpos . " " . ypos . " Down}{Click " . xpos + movX . " " . ypos + movY . " Up}"
        Sleep BUTTON_SLEEP
        sum += BUTTON_SLEEP
    }

    if (wheel != 0) {
        if (wheel > 0) {
            Loop wheel {
                Send "{WheelDown}"
            }
        } else {
            Loop -wheel {
                Send "{WheelUp}"
            }
        }
    }
    Sleep WHEEL_SLEEP
    sum += WHEEL_SLEEP

    if (selectionWait != 0) {
        Sleep selectionWait
        sum += selectionWait
    }

    ; 点击传送锚点
    op("click", [x, y], 0)

    if (wait != 0) {
        Sleep wait
        sum += wait
    } else if (selectX != 0 && selectY != 0) {
        Sleep SELECT_TWO_WAIT_SLEEP
        sum += SELECT_TWO_WAIT_SLEEP
    } else {
        Sleep BUTTON_SLEEP
        sum += BUTTON_SLEEP
    }

    if (wheel != 0) {
        DllCall("SetCursorPos", "int", 0, "int", 0)
        Sleep 10
        if (wheel > 0) {
            Loop wheel {
                Send "{WheelUp}"
            }
        } else {
            Loop -wheel {
                Send "{WheelDown}"
            }
        }
    }
    Sleep WHEEL_SLEEP
    sum += WHEEL_SLEEP

    if (selectX != 0 && selectY != 0) {
        op("click", [selectX, selectY], SELECT_TWO_CLICK_SLEEP)
        sum += SELECT_TWO_CLICK_SLEEP
    }

    ; 为了qm，补足整个延迟时间
    if (qmMode && sum < 1200) {
        qmSleep := 1200 - sum
        Sleep qmSleep
    }
    op("click", confirmPos, BUTTON_SLEEP)

    ; 如果出现地脉挡住的情况
    if (HasProp(step, "try")) {
        op("click", [x, y], SELECT_TWO_WAIT_SLEEP)
        op("click", selection[1], SELECT_TWO_CLICK_SLEEP)
        op("click", confirmPos, BUTTON_SLEEP)
    }

    ; 开始快捡
    quickPickPause := false
}

; 快速捡东西，按后退键开始咔咔乱捡，再次按后退键停止捡
quickPick() {
    static keepF := false
    if (keepF) {
        keepF := false
        return
    }
    keepF := true
    autoPick := true
    while autoPick
    {
        if (!quickPickPause) {
            Send "{Blind}f"
            Send "{WheelDown}"
            Loop QUICK_PICK_SLEEP {
                Sleep 1
                if (GetKeyState("Shift", "P") || GetKeyState("Enter", "P") || GetKeyState("Esc", "P") || GetKeyState("Alt", "P")) {
                    autoPick := false
                    break
                }
            }
        }
        if (!keepF) {
            break
        }
    }
    keepF := false
}

; 快速传送，按前进键直接传送
quickTp() {
    Send "{Click}"
    MouseGetPos &xpos, &ypos
    Sleep DIRECT_TP_SLEEP
    op("click", confirmPos, DIRECT_TP_BAG_SLEEP)
    op("move", [xpos, ypos], 0)
}

global debugMode := false

global timingIsStart := true

FileEncoding "UTF-8"

global gamingStartTime := A_Now

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

; 计时
startTiming() {
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
showCoord() {
    if (debugMode) {
        MouseGetPos &xpos, &ypos
        posText := "" . xpos . ", " . ypos
        ToolTip posText
        A_Clipboard := posText
        SetTimer () => ToolTip(), -5000
    } else {
        global routeIndex, routes
        if (routeIndex = 0) {
            ToolTip "路线未开始。"
        } else if (routeIndex >= routes.Length) {
            ToolTip "路线已结束！"
        } else {
            route := routes[routeIndex]
            if (HasProp(route, "name")) {
                ToolTip "当前是第" . routeIndex . "个点位：" . route.name . "。"
            } else {
                ToolTip "当前是第" . routeIndex . "个点位。"
            }
        }
        SetTimer () => ToolTip(), -5000
    }
}

global foodList := []

global bagOpen := false

; 快速吃药
eatFood() {
    global foodList
    global confirmPos
    global bagOpen
    ; 开背包
    sendInput "{Blind}b"
    if (!bagOpen) {
        bagOpen := true
        Sleep 600
        ; 点击食物
        op("click", foodPos, 200)
    } else {
        Sleep 500
    }

    for (food in foodList) {
        op("click", food, BUTTON_SLEEP)
        op("click", confirmPos, BUTTON_SLEEP)
    }
    ; 关闭背包
    sendInput "{Blind}b"
}

; 速射
aarr() {
    static keepAttack := false
    if (keepAttack) {
        keepAttack := false
        return
    }
    keepAttack := true
;    Loop 6 {
;        Click
;        Sleep 60
;    }

    Loop 40 {
        Send "{Blind}w"
        Sleep 60
        Click
        Sleep 200
        Click
        Sleep 250
        Send "{Blind}r"
        Sleep 80
        Send "{Blind}r"
        Sleep 100
        if (!keepAttack) {
            break
        }
    }
}

resurrection() {
    global routeIndex
    while true {
        tpNext()
        routeIndex--

        Sleep (4 * 1000)
        Click "Right"
        Sleep 60
        Click "Right"
        Sleep 60
        Click "Right"
        Sleep (6 * 1000)

        SendInput "1"
        Sleep 20
        SendInput "2"
        Sleep 20
        SendInput "3"
        Sleep 20
        SendInput "4"
        Sleep 500

        op("click", [1586, 1074], 200)
        op("click", [1872, 332], 200)

        Sleep (100 * 1000)
        ToolTip("开始跳崖！！！")
        SetTimer () => ToolTip(), -5000
        Sleep (9 * 1000)
    }
}
