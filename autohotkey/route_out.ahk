#Include "./route/642.ahk" ; 引入路线文件
index := 0
for (route in routes) {
    index++
    FileAppend 'Route(' . 'index=' . index . ', monster=[' . route.monster[1] . ', ' . route.monster[2] . '], pos=[], pos2K=[' . route.pos2K[1] . ', ' . route.pos2K[2] . ']),`n', 'D:/codeRepo/IdeaProjects/game_helper/res/642.py'
}