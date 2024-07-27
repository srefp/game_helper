global routes := [
    {monster: [2, 1], pos4K: [2298, 813],
        operations: [
;            {type: "run", turn: 5, dist: 3},
;            {type: "run", turn: 10, dist: 3.2},
            {type: "walk", turn: 5, dist: 1, dir: "w"},
            {type: "e", x: 180, y: 100},
;            {type: "space"},
;            {type: "click"},

    ]}, ; 1

    {monster: [2, 1], pos4K: [2298, 813], operations: [
        {type: "run", turn: -180, dist: 3.2}
    ]}, ; 2

    {monster: [3, 3], pos4K: [1455, 152], operations: [
        {type: "run", turn: 45, dist: 3.2},
        {type: "run", turn: -40, dist: 2}
    ]}, ; 3  {turn: -1800, dist: 2}

    {monster: [1, 3], pos4K: [1177, 933], select: 2, operations: [
        {type: "run", turn: 30, dist: 20}
    ]}, ; 3
]

; type表示类型
;   run表示奔跑 【带有参数：turn表示跑之前转的角度，正数往右转，负数往左转； dist表示跑的距离，dir表示方向，wsad表示上下左右】
;   walk表示走 【带有参数：turn表示跑之前转的角度，正数往右转，负数往左转； dist表示跑的距离，dir表示方向，wsad表示上下左右】
;   e表示使用E技能 【带有参数： x表示水平方向的E，正数往右转，负数往左转，y表示垂直方向】
;   click表示点击鼠标左键 【无参数】
