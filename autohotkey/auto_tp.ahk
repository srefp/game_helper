InstallKeybdHook
InstallMouseHook

; 常量
; 鼠标类型
global MOVE_CLICK := 1 ; 移动并点击
global MOVE := 2 ; 移动

; 延时
global BUTTON_SLEEP := 80

; 路线
global routes := [
    [
        {
            type: MOVE_CLICK,
            coord: {x: 120, y: 120}
        }
    ]
]

; 变量
global routeIndex := 1

XButton2::
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
    For _, step in steps
        if (step.type == MOVE_CLICK) {
            DllCall("SetCursorPos", "int", step.coord.x, "int", step.coord.y)
            Send "{Click}"
            Sleep BUTTON_SLEEP
        }
}
