InstallKeybdHook
InstallMouseHook

SetDefaultMouseSpeed 10

; 路线开始的点位
global routeIndex := 1

; 常量
; 鼠标类型
global MOVE_CLICK := 1 ; 移动并点击
global MOVE_CLICK_BOOK := 2 ; 移动并点击
global MOVE := 3 ; 移动
global DRAG := 4 ; 拖动
global KEYBOARD := 5 ; 按键
global WHEEL_DOWN := 6 ; 滚轮
global SHIFT := 7 ; 滚轮
global MOVE_CLICK_LONG := 8 ; 长按
global MONSTER_TRACK := 9 ; 追踪首领

; 延时
global BUTTON_SLEEP := 90 ; 点击按钮的延时
global BUTTON_SLEEP_BOOK := 400 ; 追踪延迟

CONFIRM := {type: MOVE_CLICK, data: {x: 1678, y: 1005}}

; 路线
global routes := [
    ; 1
    [
        {type: MONSTER_TRACK, data: {row: 6, column: 1}},
        {type: DRAG, data: {x: -400, y: 0}},
        {type: MOVE_CLICK, data: {x: 36, y: 903}},
        CONFIRM,
    ],
    ; 2
    [
        {type: MONSTER_TRACK, data: {row: 6, column: 1}},
        {type: MOVE_CLICK, data: {x: 563, y: 202}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 3
    [
        {type: MONSTER_TRACK, data: {row: 6, column: 1}},
        {type: MOVE_CLICK, data: {x: 1536, y: 241}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 4
    [
        {type: MONSTER_TRACK, data: {row: 6, column: 1}},
        {type: MOVE_CLICK, data: {x: 1500, y: 571}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 5
    [
        {type: MONSTER_TRACK, data: {row: 6, column: 1}},
        {type: DRAG, data: {x: 0, y: 100}},
        {type: MOVE_CLICK, data: {x: 792, y: 1056}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 6 -> 层岩
    [
        {type: MONSTER_TRACK, data: {row: 6, column: 2}},
        {type: MOVE_CLICK, data: {x: 1053, y: 264}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 7
    [
        {type: MONSTER_TRACK, data: {row: 6, column: 2}},
        {type: MOVE_CLICK, data: {x: 1065, y: 498}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 8
    [
        {type: MONSTER_TRACK, data: {row: 6, column: 2}},
        {type: MOVE_CLICK, data: {x: 1065, y: 498}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 9
    [
        {type: MONSTER_TRACK, data: {row: 6, column: 2}},
        {type: MOVE_CLICK, data: {x: 1140, y: 899}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 10
    [
        {type: MONSTER_TRACK, data: {row: 6, column: 2}},
        {type: DRAG, data: {x: 400, y: 0}},
        {type: MOVE_CLICK, data: {x: 1216, y: 1048}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 11 -> 枫丹
    [
        {type: MONSTER_TRACK, data: {row: 10, column: 2}},
        {type: MOVE_CLICK, data: {x: 1044, y: 807}}, ; 选锚点
        CONFIRM,
    ],
    ; 12
    [
        {type: MONSTER_TRACK, data: {row: 10, column: 2}},
        {type: MOVE_CLICK, data: {x: 1044, y: 807}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 13
    [
        {type: MONSTER_TRACK, data: {row: 10, column: 2}},
        {type: MOVE_CLICK, data: {x: 1147, y: 955}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 14
    [
        {type: MONSTER_TRACK, data: {row: 9, column: 2}},
        {type: MOVE_CLICK, data: {x: 1275, y: 265}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 15
    [
        {type: MONSTER_TRACK, data: {row: 10, column: 3}},
        {type: MOVE_CLICK, data: {x: 683, y: 461}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 16
    [
        {type: MONSTER_TRACK, data: {row: 10, column: 3}},
        {type: MOVE_CLICK, data: {x: 961, y: 648}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 17
    [
        {type: MONSTER_TRACK, data: {row: 10, column: 3}},
        {type: MOVE_CLICK, data: {x: 1590, y: 442}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 18
    [
        {type: MONSTER_TRACK, data: {row: 7, column: 1}},
        {type: MOVE_CLICK, data: {x: 1315, y: 1019}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 19
    [
        {type: MONSTER_TRACK, data: {row: 7, column: 1}},
        {type: MOVE_CLICK_BOOK, data: {x: 921, y: 579}}, ; 选择
        {type: MOVE_CLICK, data: {x: 1321, y: 731}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 20
    [
        {type: MONSTER_TRACK, data: {row: 7, column: 1}},
        {type: MOVE_CLICK, data: {x: 6, y: 605}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 21
    [
        {type: MONSTER_TRACK, data: {row: 7, column: 1}},
        {type: MOVE_CLICK, data: {x: 94, y: 800}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 22 神像
    [
        {type: MONSTER_TRACK, data: {row: 7, column: 1}},
        {type: MOVE_CLICK, data: {x: 851, y: 948}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 23
    [
        {type: MONSTER_TRACK, data: {row: 8, column: 1}},
        {type: MOVE_CLICK, data: {x: 1186, y: 242}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 24
    [
        {type: MONSTER_TRACK, data: {row: 7, column: 2}},
        {type: MOVE_CLICK, data: {x: 650, y: 593}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 25
    [
        {type: MONSTER_TRACK, data: {row: 7, column: 2}},
        {type: MOVE_CLICK, data: {x: 1190, y: 223}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 26
    [
        {type: MONSTER_TRACK, data: {row: 7, column: 2}},
        {type: MOVE_CLICK, data: {x: 1229, y: 32}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 27
    [
        {type: MONSTER_TRACK, data: {row: 4, column: 3}},
        {type: MOVE_CLICK, data: {x: 793, y: 720}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 28
    [
        {type: MONSTER_TRACK, data: {row: 4, column: 1}}, ; 剑鬼
        {type: MOVE_CLICK_BOOK, data: {x: 1504, y: 503}}, ; 点击传送锚点
        {type: MOVE_CLICK, data: {x: 1370, y: 734}}, ; 选择
        CONFIRM,
    ],
    ; 28
    [
        {type: MONSTER_TRACK, data: {row: 5, column: 2}},
        {type: MOVE_CLICK, data: {x: 954, y: 597}}, ; 点击传送锚点
        CONFIRM,
    ],

]

Right::
{
    global routeIndex, routes
    SendInput routeIndex
    if (routeIndex <= routes.Length) {
        executeStep routes[routeIndex]
    }
    routeIndex++
}

; 上一次追踪的怪
global prevMonster := {row: 0, column: 0}

; 执行每一步
executeStep(steps) {
    For _, step in steps {
        type := step.type
        data := step.data
        if (type = MOVE_CLICK) {
            DllCall("SetCursorPos", "int", data.x, "int", data.y)
            Send "{Click}"
            Sleep BUTTON_SLEEP
        } else if (type = DRAG) {
            MouseGetPos &xpos, &ypos
            SendEvent "{Click " . xpos . " " . ypos . " Down}{Click " . xpos - data.x . " " . ypos - data.y . " Up}"
            Sleep BUTTON_SLEEP
        } else if (type = KEYBOARD) {
            Send data
            Sleep 1000
        } else if (type = MOVE) {
            DllCall("SetCursorPos", "int", data.x, "int", data.y)
        } else if (type = WHEEL_DOWN) {
            if (data > 0) {
                LOOP data {
                    Send "{WheelDown}"
                }
            } else {
                LOOP -data {
                    Send "{WheelUp}"
                }
            }
            Sleep BUTTON_SLEEP
        } else if (type = MOVE_CLICK_BOOK) {
            DllCall("SetCursorPos", "int", data.x, "int", data.y)
            Send "{Click}"
            Sleep BUTTON_SLEEP_BOOK
        } else if (type = SHIFT) {
            SendInput "{LShift down}"
            Sleep 80
            SendInput "{LShift up}"
            Sleep BUTTON_SLEEP_BOOK
        } else if (type = MOVE_CLICK_LONG) {
            DllCall("SetCursorPos", "int", data.x, "int", data.y)
            SendInput "{LButton down}"
            Sleep 60
            SendInput "{LButton up}"
        } else if (type = MONSTER_TRACK) {
            global prevMonster
            ; 开书
            Send "{F1}"
            Sleep 600
            DllCall("SetCursorPos", "int", 956, "int", 283) ; 清空滚轮
            SendInput "{LButton down}"
            Sleep 60
            SendInput "{LButton up}"
            wheel := (data.row - 1) * 9
            LOOP wheel {
                Send "{WheelDown}"
            }
            Sleep 100

            map := [500, 680, 860]
            monsterPosX := map[data.column]
            DllCall("SetCursorPos", "int", monsterPosX, "int", 350)
            Send "{Click}"
            Sleep 60

            DllCall("SetCursorPos", "int", 1460, "int", 840)
            if (prevMonster.row = data.row && prevMonster.column = data.column) {
                Send "{Click}"
                Sleep 60
                Send "{Click}"
                Sleep 400
            } else {
                Send "{Click}"
                Sleep 500
                prevMonster.row := data.row
                prevMonster.column := data.column
            }

        }
    }
}