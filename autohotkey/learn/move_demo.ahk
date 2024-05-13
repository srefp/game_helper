InstallKeybdHook
InstallMouseHook

SetDefaultMouseSpeed 10

XButton2::
{
;    MouseClickDrag "L", 696, 634, 984, 408, 100
;    SendEvent "{Click 696 634 Down}"
;    Sleep 40
;    MouseMove 948, 408
;    Sleep 40
;    SendEvent "{Click 984 408 Up}"
    SendEvent "{Click 696 634 Down}{Click 984 408 Up}"
}
