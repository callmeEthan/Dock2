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