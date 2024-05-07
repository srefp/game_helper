-- 57722, 61207
function OnEvent(event, arg)
  -- 如果你使用了鼠标，并且是点击
  if(event == "MOUSE_BUTTON_PRESSED" and arg == 5) then
  -- 按下并松开按钮
  PressAndReleaseMouseButton(1)
  -- 等待85ms
  Sleep(85)
  -- 先获取当前的鼠标位置
  x, y = GetMousePosition()
  -- 移动到传送按钮的位置
  MoveMouseTo(57722 + math.random(0, 20), 61207 + math.random(0, 22))
  -- 按下并松开按钮
  PressAndReleaseMouseButton(1)
  -- 等待60ms
  Sleep(60)
  -- 移动到原来的位置
  MoveMouseTo(x, y)
  end
end