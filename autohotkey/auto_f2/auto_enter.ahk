; 配置项
global inPos := [55753, 14631] ; 第一个申请加入按钮的位置
global exitWorldPos := [56300, 61407] ; 退出多人世界按钮的位置
global OPT_DELAY := 400 ; 短等待

#Include "../func/base.ahk" ; 引入函数

Alt & Z::findFriend()
XButton1::findFriend()

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

exitWorld() {
    Send "{F2}"
    Sleep OPT_DELAY
    op("click", exitWorldPos, 0)
}