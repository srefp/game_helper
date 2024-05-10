InstallKeybdHook
InstallMouseHook

SetDefaultMouseSpeed 10

; 路线开始的点位
global routeIndex := 11

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

; 延时
global BUTTON_SLEEP := 120 ; 点击按钮的延时
global DRAG_DELAY := 100 ; 拖动延时
global BUTTON_SLEEP_BOOK := 600 ; 追踪延迟
BOOK_CLICK1 := {type: KEYBOARD, data: "{F1}"} ; 开书
BOOK_CLICK2 := {type: MOVE_CLICK, data: {x: 294, y: 545}} ; 讨伐
BOOK_CLICK3 := {type: MOVE_CLICK, data: {x: 493, y: 199}} ; 首领按钮
BOOK_CLICK4 := {type: MOVE_CLICK, data: {x: 511, y: 431}} ; 首领按钮
BOOK_CLICK5 := {type: MOVE_CLICK_LONG, data: {x: 955, y: 292}} ; 首领按钮
TRACK_CLICK_CANCEL := {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
TRACK_CLICK := {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪

DRAGON_MONSTER := {type: MOVE_CLICK, data: {x: 497, y: 805}} ; 渊下宫水龙蜥
SNAKE_MONSTER := {type: MOVE_CLICK, data: {x: 673, y: 805}} ; 巨蛇
WATER_MAN_MONSTER := {type: MOVE_CLICK, data: {x: 681, y: 743}} ; 水型幻人

OPEN_MAP := {type: SHIFT,  data: ""}
CONFIRM := {type: MOVE_CLICK, data: {x: 1678, y: 1005}}
MAP_SELECTION := {type: MOVE_CLICK, data: {x: 1760, y: 1017}}

; 路线
global routes := [
    [
        {type: WHEEL_DOWN, data: 20},
        DRAGON_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: DRAG, data: {x: -400, y: 0}},
        {type: MOVE_CLICK, data: {x: 36, y: 903}},
        CONFIRM,
    ],
    [
        {type: WHEEL_DOWN, data: 20},
        DRAGON_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: MOVE_CLICK, data: {x: 563, y: 202}}, ; 点击传送锚点
        CONFIRM,
    ],
    [
        {type: WHEEL_DOWN, data: 20},
        DRAGON_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: MOVE_CLICK, data: {x: 1536, y: 241}}, ; 点击传送锚点
        CONFIRM,
    ],
    [
        {type: WHEEL_DOWN, data: 20},
        DRAGON_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: MOVE_CLICK, data: {x: 1500, y: 571}}, ; 点击传送锚点
        CONFIRM,
    ],
    [
        {type: WHEEL_DOWN, data: 20},
        DRAGON_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: DRAG, data: {x: 0, y: 100}},
        {type: MOVE_CLICK, data: {x: 792, y: 1056}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 6 -> 层岩
    [
        {type: WHEEL_DOWN, data: 20},
        SNAKE_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: MOVE_CLICK, data: {x: 1053, y: 264}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 7
    [
        {type: WHEEL_DOWN, data: 20},
        SNAKE_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: MOVE_CLICK, data: {x: 1065, y: 498}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 8
    [
        {type: WHEEL_DOWN, data: 20},
        SNAKE_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: MOVE_CLICK, data: {x: 1065, y: 498}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 9
    [
        {type: WHEEL_DOWN, data: 20},
        SNAKE_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: MOVE_CLICK, data: {x: 1140, y: 899}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 10
    [
        {type: WHEEL_DOWN, data: 20},
        SNAKE_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: DRAG, data: {x: 400, y: 0}},
        {type: MOVE_CLICK, data: {x: 1216, y: 1048}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 11 -> 枫丹
    [
        {type: WHEEL_DOWN, data: 60},
        WATER_MAN_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: MOVE_CLICK, data: {x: 1044, y: 807}}, ; 选锚点
        CONFIRM,
    ],
    ; 12
    [
        {type: WHEEL_DOWN, data: 60},
        WATER_MAN_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: MOVE_CLICK, data: {x: 1041, y: 806}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 13
    [
        {type: WHEEL_DOWN, data: 60},
        WATER_MAN_MONSTER,
        TRACK_CLICK_CANCEL,
        TRACK_CLICK,
        {type: MOVE_CLICK, data: {x: 1147, y: 955}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 14
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 686, y: 393}}, ; 选择螃蟹
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1275, y: 265}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 15
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 868, y: 716}}, ; 选择甘雨二大爷
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 683, y: 461}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 16
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 961, y: 648}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 17
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1590, y: 442}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 18
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1590, y: 442}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 19
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: WHEEL_DOWN, data: -25},
        {type: MOVE_CLICK, data: {x: 498, y: 515}}, ; 选择鸡哥
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1315, y: 1019}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 20
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK_BOOK, data: {x: 921, y: 579}}, ; 点击传送锚点
        {type: MOVE_CLICK, data: {x: 1321, y: 731}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 21
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 6, y: 605}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 22
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 94, y: 800}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 23 神像
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 851, y: 948}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 24
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 498, y: 724}}, ; 选择无相草
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1186, y: 242}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 25
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 678, y: 390}}, ; 选择机械龙兽
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 650, y: 593}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 26
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1190, y: 223}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 27
    [
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1229, y: 32}}, ; 点击传送锚点
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

; 执行每一步
executeStep(steps) {
    steps.InsertAt(1, BOOK_CLICK1, BOOK_CLICK2, BOOK_CLICK3, BOOK_CLICK4, BOOK_CLICK5)
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
        }
    }
}

; 前进
XButton2::
{
    MouseGetPos &xpos, &ypos
    ToolTip "" . xpos . ", " . ypos
}
