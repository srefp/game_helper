; 此脚本仅用于娱乐和内部交流！
; 我们的口号是：愿天下没有不认路的车车！愿天下没有不敢上的快车！
; 开发者精力有限，此脚本只适用于1080P和2K屏幕的电脑端键鼠操作。
;
; 使用教程：
; 一、注意：
;   侧键1指的是鼠标左侧的侧键中处于前面的那个侧键，也被称为向前翻页键
;   侧键2指的是鼠标左侧的侧键中处于后面的那个侧键，也被称为向后翻页键
; 二、功能
;   1、侧键1：快速吃药和快速点击锚点传送。（效果为：按下后单击鼠标，鼠标移动到确认按钮后再次单击鼠标，最后把鼠标移动到原来的位置。）
;   2、侧键2：按下后开始快捡。（效果为疯狂按F和滚轮）
;   3、键盘右键：自动传送到路线的下一个点位。
;   4、键盘左键：自动传送到路线的上一个点位。
;   5、键盘上键：显示当前所在第几个点位。
;   6、键盘下键：开始计时和结束计时。
;
; 三、配置
;   1、在引入路线文件的配置中，修改为你所需要的路线文件进行引入。
;   2、默认第一个点位需要手动传送过去，如果是自己开地，将routeIndex改为0，从而传送到第一个点位。

#Include "./route/-6.ahk" ; 引入路线文件
global routeIndex := 1 ; 路线开始的点位 0表示带起点，1表示忽略起点
global hintEnabled := false ; 是否开启提示
global BOOK_SLEEP := 450 ; 不跨怪开书等待时间
global BOOK_SLEEP2 := 600 ; 跨怪开书等待时间
global BOOK_SLEEP3 := 600 ; 首次开书等待时间
global MAP_SLEEP := 300 ; 不跨怪Map等待时间
global MAP_SLEEP2 := 500 ; 跨怪Map等待时间
global timingFile := "D:/codeRepo/IdeaProjects/game_helper/timing/-6.txt" ; 计时文件的绝对路径


#Include "./hotkey.ahk" ; 引入快捷键文件
