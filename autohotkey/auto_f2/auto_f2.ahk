; 配置项
global inPos := [3266, 482] ; 第一个申请加入按钮的位置
global exitWorldPos := [3298, 2023] ; 退出多人世界按钮的位置
global OPT_DELAY := 400 ; 短等待
global LONG_DELAY := 4000 ; 长等待
global ENTER_WORLD_DELAY := 11 * 1000 ; 进入世界后的延迟
global EXIT_WORLD_DELAY := 8 * 1000 ; 退出世界后的延迟
global CIRCLE := 6606 ; 转一圈的鼠标唯一
global ONE_DEGREE := CIRCLE / 360 ; 一度是多少
global NAME := "小灯草" ; 名称

; 每次输入的内容不一样，防止被封
global textList := [
    "你好，请问可以拿点" . NAME . "吗？",
    "今天天气不错，请问可以拿点" . NAME . "吗？",
    "嗨嗨嗨~请问可以拿点" . NAME . "吗？",
    "喵喵喵~请问可以拿点" . NAME . "吗？",
    "你好，小灯草可以拿点" . NAME . "吗？",
    "今天天气不错，" . NAME . "可以拿点吗？",
    "嗨嗨嗨~" . NAME . "可以拿点吗？",
    "喵喵喵~" . NAME . "可以拿点吗？",
]


#Include "../func/base.ahk" ; 引入函数
#Include "../func/hotkey.ahk" ; 引入快捷键
#Include "../routef2/小灯草.ahk" ; 引入路线

Sleep 3 * 1000


while (true) {
;    ; 批量F2
;    findFriend()
;
;    ; 等待进入世界
;    Sleep ENTER_WORLD_DELAY
;
;    ; 对话
;    communicate()

    Loop routes.Length {
;        ; 传送到点位
;        tpNext(false)
;        Sleep LONG_DELAY
        routeIndex++

        tip("开始", 2000)
        ; 走直线，捡东西
        actOperations()
    }

    ; 退出世界
    tip("结束", 2000)
    Sleep 1000 * 1000 * 1000
    exitWorld()
}

findFriend() {
    Loop 3 {
        Send "{F2}"
        Sleep OPT_DELAY
        Loop 30 {
            op("click", inPos, 2)
            Loop 9 {
                Send "{WheelDown}"
            }
            Sleep 5
        }
        Send "{Esc}"
        Sleep OPT_DELAY
    }
}

communicate() {
    SendInput "{Enter}"
    Sleep OPT_DELAY
    SendInput "{Enter}"
    Sleep OPT_DELAY

    SendInput textList[Random(1, textList.Length)]
    Sleep OPT_DELAY
    SendInput "{Enter}"
    Sleep OPT_DELAY
    Send "{Esc}"
    Sleep OPT_DELAY
}

actOperations() {
    operations := routes[routeIndex].operations

    for (operation in operations) {
        act(operation)
    }
}

exitWorld() {
    Send "{F2}"
    Sleep OPT_DELAY
    op("click", exitWorldPos, EXIT_WORLD_DELAY)
}

act(operation) {
    type := operation.type

    ; 如果你有方向，以你的方向为准，如果你没有方向，默认向前
    dir := "w"
    if (HasProp(operation, "dir")) {
        dir := operation.dir
    }

    tip("type" . type, 2000)


    if (type = "run") {
        tip("here run", 2000)

        DllCall("mouse_event", "Uint", 0x01, "UInt", operation.turn * ONE_DEGREE, "Uint", 0)
        Sleep OPT_DELAY

        ; 奔向终点
        Send "{" . operation.dir . " Down}"

        index := 0
        Loop (operation.dist * 100) {
            index++
            ; 前1s和后1s不冲刺
            if (index > 100 && index < (operation.dist - 1) * 100) {
                Click "Right"
            }

;            SendInput "{Blind}f"
            Sleep 10
        }

        Send "{" . operation.dir . " Up}"


    } else if (type = "e") {
        Send "{e Down}"
        Sleep OPT_DELAY
        DllCall("mouse_event", "Uint", 0x01, "UInt", operation.x * ONE_DEGREE, "Uint", operation.y)
        Sleep OPT_DELAY
        Send "{e Up}"
        Sleep OPT_DELAY


    } else if (type = "walk") {
        Send "{" . operation.dir . " Down}"

        Loop (operation.dist * 100) {
;            SendInput "{Blind}f"
            Sleep 10
        }
        Send "{" . operation.dir . " Up}"


    } else if (type = "click") {
        Send "{Click}"
        Sleep OPT_DELAY


    }
}
