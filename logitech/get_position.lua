function OnEvent(event, arg)
 -- arg 1:左键，2：右键，3：滚轮，4:后退 5:前进
  if(event == "MOUSE_BUTTON_PRESSED" and arg == 2) then
  x, y = GetMousePosition()
  OutputLogMessage("Mouse is at %d, %d\n",x,y)
  end
end