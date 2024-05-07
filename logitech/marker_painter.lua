-- 控制标点之间的间隔
LEN = 1000
-- 竖轴系数（用于调整图形的高度）
VK = 3
-- 横轴系数（用于调整图形的宽度）
HK = 1
-- 每条边的标点数量（不少于2个）
NUM_PER_EDGE = 3
-- 六芒星标点按钮位置
MARK_BUTTON_POS_X, MARK_BUTTON_POS_Y = 57082, 8201
-- 确认按钮位置
CONFIRM_BUTTON_POS_X, CONFIRM_BUTTON_POS_Y = 57124, 61207
-- 鼠标停留时间
SLEEP_MILLI_SECONDS = 500
-- 标点按下后停留的时间
MARK_SLEEP_MILL_SECONDS = 80
-- 鼠标左键
LEFT_MOUSE_BUTTON = 1

-- 定义当前标点位置
curX, curY = 0, 0

function OnEvent(event, arg)
    -- 按下前进键
    if(event == "MOUSE_BUTTON_RELEASED" and arg == 5) then
        -- 从鼠标目前的位置开始绘画
        curX, curY = GetMousePosition()
        for edgeIndex = 1, 12 do
            for _ = 1, NUM_PER_EDGE - 1 do
                ClickAndMark(edgeIndex)
            end
        end
    end
end

-- 标点
function ClickAndMark(edgeIndex)
    -- 鼠标移动到下个标点的位置
    MoveMouseTo(GetPos(edgeIndex))
    -- 按下鼠标左键
    PressMouseButton(LEFT_MOUSE_BUTTON)
    Sleep(MARK_SLEEP_MILL_SECONDS)
    -- 松开鼠标左键
    ReleaseMouseButton(LEFT_MOUSE_BUTTON)
    Sleep(SLEEP_MILLI_SECONDS)

    -- 移动到改变标点形状的按钮的位置
    MoveMouseTo(MARK_BUTTON_POS_X, MARK_BUTTON_POS_Y)
    -- 按下并松开左键
    PressAndReleaseMouseButton(LEFT_MOUSE_BUTTON)
    Sleep(SLEEP_MILLI_SECONDS)

    -- 移动到确认按钮的位置
    MoveMouseTo(CONFIRM_BUTTON_POS_X, CONFIRM_BUTTON_POS_Y)
    -- 按下并松开左键
    PressAndReleaseMouseButton(LEFT_MOUSE_BUTTON)
    Sleep(SLEEP_MILLI_SECONDS)
end

-- 根据边的索引获取下一个标点的位置
function GetPos(edgeIndex)
    if (edgeIndex == 1 or edgeIndex == 4) then
        curX, curY = curX + LEN, curY
    elseif (edgeIndex == 2 or edgeIndex == 11) then
        curX, curY = curX + HK * LEN, curY - VK * LEN
    elseif (edgeIndex == 3 or edgeIndex == 6) then
        curX, curY = curX + HK * LEN, curY + VK * LEN
    elseif (edgeIndex == 5 or edgeIndex == 8) then
        curX, curY = curX - HK * LEN, curY + VK * LEN
    elseif (edgeIndex == 7 or edgeIndex == 10) then
        curX, curY = curX - LEN, curY
    elseif (edgeIndex == 9 or edgeIndex == 12) then
        curX, curY = curX - HK * LEN, curY - VK * LEN
    end
    return curX, curY
end
