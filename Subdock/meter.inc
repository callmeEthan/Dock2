[Icon1]
Meter=Image
ImageName=#@#App\#Gamecover1#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(1,1)"][!SetOption Icon1 "ImageTint" "255,255,255"][!UpdateMeter Icon1][!Redraw]
LeftMouseDownAction=!Execute [!SetOption Icon1 "ImageTint" "100,100,100"][!UpdateMeter Icon1][!Redraw]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(1,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(1)"][!CommandMeasure ImageDisplay "swap('#Background1#')" "#ROOTCONFIG#"]
MeterStyle=LayoutIcon

[DragNDropChild1]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
ProcessAllFiles=1
OnEnterAction=[!SetVariable Edit 1][!CommandMeasure "Animate" "highlight(1)"]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(1)"]
Group=DropGroup
Bounds = Icon1
Disabled=1

[Icon2]
Meter=Image
ImageName=#@#App\#Gamecover2#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(2,1)"][!SetOption Icon2 "ImageTint" "255,255,255"][!UpdateMeter Icon2][!Redraw]
LeftMouseDownAction=!Execute [!SetOption Icon2 "ImageTint" "100,100,100"][!UpdateMeter Icon2][!Redraw]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(2,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(2)"][!CommandMeasure ImageDisplay "swap('#Background2#')" "#ROOTCONFIG#"]
MeterStyle=LayoutIcon

[DragNDropChild2]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
ProcessAllFiles=1
OnEnterAction=[!SetVariable Edit 2][!CommandMeasure "Animate" "highlight(2)"]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(2)"]
Group=DropGroup
Bounds = Icon2
Disabled=1

[Icon3]
Meter=Image
ImageName=#@#App\#Gamecover3#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(3,1)"][!SetOption Icon3 "ImageTint" "255,255,255"][!UpdateMeter Icon3][!Redraw]
LeftMouseDownAction=!Execute [!SetOption Icon3 "ImageTint" "100,100,100"][!UpdateMeter Icon3][!Redraw]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(3,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(3)"][!CommandMeasure ImageDisplay "swap('#Background3#')" "#ROOTCONFIG#"]
MeterStyle=LayoutIcon

[DragNDropChild3]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
ProcessAllFiles=1
OnEnterAction=[!SetVariable Edit 3][!CommandMeasure "Animate" "highlight(3)"]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(3)"]
Group=DropGroup
Bounds = Icon3
Disabled=1

[Icon4]
Meter=Image
ImageName=#@#App\#Gamecover4#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(4,1)"][!SetOption Icon4 "ImageTint" "255,255,255"][!UpdateMeter Icon4][!Redraw]
LeftMouseDownAction=!Execute [!SetOption Icon4 "ImageTint" "100,100,100"][!UpdateMeter Icon4][!Redraw]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(4,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(4)"][!CommandMeasure ImageDisplay "swap('#Background4#')" "#ROOTCONFIG#"]
MeterStyle=LayoutIcon

[DragNDropChild4]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
ProcessAllFiles=1
OnEnterAction=[!SetVariable Edit 4][!CommandMeasure "Animate" "highlight(4)"]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(4)"]
Group=DropGroup
Bounds = Icon4
Disabled=1

[Icon5]
Meter=Image
ImageName=#@#App\#Gamecover5#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(5,1)"][!SetOption Icon5 "ImageTint" "255,255,255"][!UpdateMeter Icon5][!Redraw]
LeftMouseDownAction=!Execute [!SetOption Icon5 "ImageTint" "100,100,100"][!UpdateMeter Icon5][!Redraw]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(5,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(5)"][!CommandMeasure ImageDisplay "swap('#Background5#')" "#ROOTCONFIG#"]
MeterStyle=LayoutIcon

[DragNDropChild5]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
ProcessAllFiles=1
OnEnterAction=[!SetVariable Edit 5][!CommandMeasure "Animate" "highlight(5)"]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(5)"]
Group=DropGroup
Bounds = Icon5
Disabled=1

[Icon6]
Meter=Image
ImageName=#@#App\#Gamecover6#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(6,1)"][!SetOption Icon6 "ImageTint" "255,255,255"][!UpdateMeter Icon6][!Redraw]
LeftMouseDownAction=!Execute [!SetOption Icon6 "ImageTint" "100,100,100"][!UpdateMeter Icon6][!Redraw]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(6,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(6)"][!CommandMeasure ImageDisplay "swap('#Background6#')" "#ROOTCONFIG#"]
MeterStyle=LayoutIcon

[DragNDropChild6]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
ProcessAllFiles=1
OnEnterAction=[!SetVariable Edit 6][!CommandMeasure "Animate" "highlight(6)"]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(6)"]
Group=DropGroup
Bounds = Icon6
Disabled=1

[Icon7]
Meter=Image
ImageName=#@#App\#Gamecover7#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(7,1)"][!SetOption Icon7 "ImageTint" "255,255,255"][!UpdateMeter Icon7][!Redraw]
LeftMouseDownAction=!Execute [!SetOption Icon7 "ImageTint" "100,100,100"][!UpdateMeter Icon7][!Redraw]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(7,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(7)"][!CommandMeasure ImageDisplay "swap('#Background7#')" "#ROOTCONFIG#"]
MeterStyle=LayoutIcon

[DragNDropChild7]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
ProcessAllFiles=1
OnEnterAction=[!SetVariable Edit 7][!CommandMeasure "Animate" "highlight(7)"]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(7)"]
Group=DropGroup
Bounds = Icon7
Disabled=1

[Icon8]
Meter=Image
ImageName=#@#App\#Gamecover8#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(8,1)"][!SetOption Icon8 "ImageTint" "255,255,255"][!UpdateMeter Icon8][!Redraw]
LeftMouseDownAction=!Execute [!SetOption Icon8 "ImageTint" "100,100,100"][!UpdateMeter Icon8][!Redraw]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(8,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(8)"][!CommandMeasure ImageDisplay "swap('#Background8#')" "#ROOTCONFIG#"]
MeterStyle=LayoutIcon

[DragNDropChild8]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
ProcessAllFiles=1
OnEnterAction=[!SetVariable Edit 8][!CommandMeasure "Animate" "highlight(8)"]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(8)"]
Group=DropGroup
Bounds = Icon8
Disabled=1

[Hotkey1]
Measure=Plugin
Plugin=HotKey
HotKey=Y
KeyDownAction=[!CommandMeasure "Animate" "hotkey(3)"]

[Hotkey2]
Measure=Plugin
Plugin=HotKey
HotKey=S
KeyDownAction=[!CommandMeasure "Animate" "hotkey(8)"]

[Hotkey3]
Measure=Plugin
Plugin=HotKey
HotKey=R
KeyDownAction=[!CommandMeasure "Animate" "hotkey(1)"]

[Hotkey4]
Measure=Plugin
Plugin=HotKey
HotKey=T
KeyDownAction=[!CommandMeasure "Animate" "hotkey(7)"]

[Hotkey5]
Measure=Plugin
Plugin=HotKey
HotKey=D
KeyDownAction=[!CommandMeasure "Animate" "hotkey(4)"]

[Hotkey6]
Measure=Plugin
Plugin=HotKey
HotKey=G
KeyDownAction=[!CommandMeasure "Animate" "hotkey(5)"]

[Hotkey7]
Measure=Plugin
Plugin=HotKey
HotKey=N
KeyDownAction=[!CommandMeasure "Animate" "hotkey(2)"]

[Variables]
HotkeyCount=7