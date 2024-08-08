global routes := [
    {monster: [2, 1], pos: [39229, 24678],
        operations: [
            {type: "run", turn: 8, dist: 4.2},
            {type: "run", turn: 30, dist: 2},
    ]}, ; 1

    {monster: [2, 1], pos: [39229, 24678], operations: [
        {type: "walk", turn: 10, dir: "s", dist: 4.6},
        {type: "walk", turn: 90, dir: "a", dist: 0.7},
    ]}, ; 2

    {monster: [3, 3], pos: [24838, 4614], operations: [
        {type: "run", turn: 45, dist: 4.5},
        {type: "run", turn: -40, dist: 3.4},
        {type: "run", turn: -180, dist: 1},
        {type: "e", x: 0, y: 0},
    ]}, ; 3

    {monster: [1, 3], pos: [20092, 28321], select: 2, operations: [
        {type: "run", turn: -30, dir: "d", dist: 14},
        {type: "run", turn: -60, dist: 3},
        {type: "run", turn: 90, dist: 1},
    ]}, ; 3
]

; type表示类型
;   run表示奔跑 【带有参数：turn表示跑之前转的角度，正数往右转，负数往左转； dist表示跑的距离，dir表示方向，wsad表示上下左右】
;   walk表示走 【带有参数：turn表示跑之前转的角度，正数往右转，负数往左转； dist表示跑的距离，dir表示方向，wsad表示上下左右】
;   e表示使用E技能 【带有参数： x表示水平方向的E，正数往右转，负数往左转，y表示垂直方向】
;   click表示点击鼠标左键 【无参数】
