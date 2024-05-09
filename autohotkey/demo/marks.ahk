#Include constants.ahk

InstallKeybdHook
InstallMouseHook

MASTER_CLICK1 := {type: MOVE_CLICK, data: {x: 493, y: 199}} ; 首领按钮
MASTER_CLICK2 := {type: MOVE_CLICK, data: {x: 514, y: 425}} ; 首领按钮
OPEN_MAP := {type: SHIFT,  data: ""}
CONFIRM := {type: MOVE_CLICK, data: {x: 1678, y: 1005}}
MAP_SELECTION := {type: MOVE_CLICK, data: {x: 1760, y: 1017}}

; 路线
global marksArr := [
    [
        "渊下宫1",
        OPEN_MAP, ; 开地图
        MAP_SELECTION, ; 选择地图
        {type: MOVE_CLICK, data: {x: 1429, y: 512}}, ; 选渊下宫
        {type: DRAG, data: {x: -450, y: 0}},
        {type: MOVE_CLICK, data: {x: 152, y: 903}},
        CONFIRM,
    ],
    [
        "渊下宫2",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 294, y: 545}},
        MASTER_CLICK1,
        MASTER_CLICK2,
        {type: MOVE, data: {x: 752, y: 502}},
        {type: WHEEL_DOWN, data: -20},
        {type: WHEEL_DOWN, data: 20},
        {type: MOVE_CLICK, data: {x: 497, y: 805}}, ; 点击头像
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 563, y: 202}}, ; 点击传送锚点
        CONFIRM,
    ],
    [
        "渊下宫3",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1536, y: 241}}, ; 点击传送锚点
        CONFIRM,
    ],
    [
        "渊下宫4",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1500, y: 571}}, ; 点击传送锚点
        CONFIRM,
    ],
    [
        "渊下宫5",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: DRAG, data: {x: 0, y: 100}},
        {type: MOVE_CLICK, data: {x: 792, y: 1056}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 6 -> 层岩
    [
        "层岩1",
        OPEN_MAP, ; 开地图
        MAP_SELECTION, ; 选择地图
        {type: MOVE_CLICK_BOOK, data: {x: 1750, y: 508}}, ; 选层岩
        {type: MOVE_CLICK, data: {x: 960, y: 539}}, ; 选锚点
        CONFIRM,
    ],
    ; 7
    [
        "层岩2",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 688, y: 559}}, ; 选择巨蛇
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1065, y: 498}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 8
    [
        "层岩3",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 688, y: 559}}, ; 选择巨蛇
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1065, y: 498}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 9
    [
        "层岩4",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 688, y: 559}}, ; 选择巨蛇
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1140, y: 899}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 10
    [
        "层岩5",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 688, y: 559}}, ; 选择巨蛇
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: DRAG, data: {x: 400, y: 0}},
        {type: MOVE_CLICK, data: {x: 1216, y: 1048}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 11 -> 枫丹
    [
        "枫丹1",
        OPEN_MAP, ; 开地图
        MAP_SELECTION, ; 选择地图
        {type: MOVE_CLICK_BOOK, data: {x: 1430, y: 395}}, ; 选枫丹
        {type: DRAG, data: {x: -400, y: 200}},
        {type: MOVE_CLICK, data: {x: 706, y: 987}}, ; 选锚点
        CONFIRM,
    ],
    ; 12
    [
        "枫丹2",
        {type: KEYBOARD, data: "{F1}"},
        {type: WHEEL_DOWN, data: 30},
        {type: MOVE_CLICK, data: {x: 672, y: 669}}, ; 选择巨蛇
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1041, y: 806}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 13
    [
        "枫丹3",
        {type: KEYBOARD, data: "{F1}"},
        {type: WHEEL_DOWN, data: 30},
        {type: MOVE_CLICK, data: {x: 672, y: 669}}, ; 选择水型幻人
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1147, y: 955}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 14
    [
        "枫丹4",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 686, y: 393}}, ; 选择螃蟹
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1275, y: 265}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 15
    [
        "枫丹5",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 868, y: 716}}, ; 选择甘雨二大爷
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 683, y: 461}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 16
    [
        "枫丹6",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 961, y: 648}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 17
    [
        "枫丹7",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1590, y: 442}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 18
    [
        "枫丹8",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1590, y: 442}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 19
    [
        "枫丹9",
        {type: KEYBOARD, data: "{F1}"},
        {type: WHEEL_DOWN, data: -25},
        {type: MOVE_CLICK, data: {x: 498, y: 515}}, ; 选择鸡哥
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1315, y: 1019}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 20
    [
        "枫丹10",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK_BOOK, data: {x: 921, y: 579}}, ; 点击传送锚点
        {type: MOVE_CLICK, data: {x: 1321, y: 731}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 21
    [
        "枫丹11",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 6, y: 605}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 22
    [
        "枫丹12",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 94, y: 800}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 23 神像
    [
        "枫丹13",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 851, y: 948}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 24
    [
        "枫丹14",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 498, y: 724}}, ; 选择无相草
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1186, y: 242}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 25
    [
        "枫丹15",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 678, y: 390}}, ; 选择机械龙兽
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 650, y: 593}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 26
    [
        "枫丹6",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1190, y: 223}}, ; 点击传送锚点
        CONFIRM,
    ],
    ; 27
    [
        "枫丹17",
        {type: KEYBOARD, data: "{F1}"},
        {type: MOVE_CLICK, data: {x: 1460, y: 839}}, ; 取消追踪
        {type: MOVE_CLICK_BOOK, data: {x: 1460, y: 839}}, ; 确认追踪
        {type: MOVE_CLICK, data: {x: 1229, y: 32}}, ; 点击传送锚点
        CONFIRM,
    ],

]

marks := Map()
global nameIndex := 1

for _, markItem in marksArr {
    markName := markItem.RemoveAt(nameIndex)
    marks[markName] := markItem
}
