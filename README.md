# 原神锄地自动传送

### 1. 下载git

访问git官网：https://git-scm.com

![image-20240723093956385](./README.assets/image-20240723093956385.png)

![image-20240723094039796](./README.assets/image-20240723094039796.png)

之后一路点击Next安装成功。



### 2. 安装jetbrains toolbox

访问链接直接下载：[感谢您下载 Toolbox App！ (jetbrains.com.cn)](https://www.jetbrains.com.cn/toolbox-app/download/download-thanks.html)

一路点击Next安装。

安装完成后打开toolbox安装IDEA。

![image-20240723094305063](./README.assets/image-20240723094305063.png)

![image-20240723094450848](./README.assets/image-20240723094450848.png)



访问以下代码网站：[代码链接](http://106.55.181.191:12200/root/game_helper)

![image-20240723093845403](./README.assets/image-20240723093845403.png)



把复制的链接粘贴到IDEA中。

![image-20240723094627779](./README.assets/image-20240723094627779.png)

![image-20240723094941551](./README.assets/image-20240723094941551.png)



### 3. 打开Settings，下载autohotkey插件

![image-20240723095022607](./README.assets/image-20240723095022607.png)

![image-20240723095143460](./README.assets/image-20240723095143460.png)

![image-20240723095327733](./README.assets/image-20240723095327733.png)

安装插件后可能需要重新启动IDEA，先关闭，然后按win键搜索，一定要以管理员方式打开，以后每次都要以管理员方式打开，也可以在jetbrains toolbox中配置以管理员方式打开（请自行摸索）

![image-20240723095600286](./README.assets/image-20240723095600286.png)

### 4. 再次打开Settings，配置autohotkey的地址

这里打开Settings和上面一样。

![image-20240723095725298](./README.assets/image-20240723095725298.png)

![image-20240723100002994](./README.assets/image-20240723100002994.png)

![image-20240723100042243](./README.assets/image-20240723100042243.png)

![image-20240723100111710](./README.assets/image-20240723100111710.png)

![image-20240723100152082](./README.assets/image-20240723100152082.png)

![image-20240723100254265](./README.assets/image-20240723100254265.png)

### 5. 使用教程

#### （1）右下角传送

将鼠标移动到锚点的位置，点击鼠标侧键1，也就是G5键，可以直接传送。（帮你点确认），如果锚点需要多选，需要单击锚点，对选项进行侧键1，才能传送。这个侧键就是帮你点确认的。

> 虽然我可以让它变成即便多个锚点也能帮你选择进行传送，但是如果你没有点歪了，没有点到锚点，会切换到尘歌壶，所以后来我把自动帮你选这个功能取消了。

#### （2）自动传送

启动`main.ahk`脚本，进行自动传送。

点击键盘`->`键，自动传送，可以修改`main.ahk`中的`fastMode := true`，直接打开地图传，如果设置为`fastMode := false`，则全程使用F1追怪传送。

