[Icon1]
Meter=Image
ImageName=#@#App\#Gamecover1#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(1,1)"]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(1,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(1)"]
MeterStyle=LayoutIcon

[DragNDropChild1]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
OnEnterAction=[!SetVariable Edit 1]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(1)"]
Group=DropGroup
Bounds = Icon1
Disabled=1

[Icon2]
Meter=Image
ImageName=#@#App\#Gamecover2#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(2,1)"]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(2,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(2)"]
MeterStyle=LayoutIcon

[DragNDropChild2]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
OnEnterAction=[!SetVariable Edit 2]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(2)"]
Group=DropGroup
Bounds = Icon2
Disabled=1

[Icon3]
Meter=Image
ImageName=#@#App\#Gamecover3#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(3,1)"]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(3,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(3)"]
MeterStyle=LayoutIcon

[DragNDropChild3]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
OnEnterAction=[!SetVariable Edit 3]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(3)"]
Group=DropGroup
Bounds = Icon3
Disabled=1

[Icon4]
Meter=Image
ImageName=#@#App\#Gamecover4#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(4,1)"]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(4,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(4)"]
MeterStyle=LayoutIcon

[DragNDropChild4]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
OnEnterAction=[!SetVariable Edit 4]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(4)"]
Group=DropGroup
Bounds = Icon4
Disabled=1

[Icon5]
Meter=Image
ImageName=#@#App\#Gamecover5#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(5,1)"]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(5,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(5)"]
MeterStyle=LayoutIcon

[DragNDropChild5]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
OnEnterAction=[!SetVariable Edit 5]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(5)"]
Group=DropGroup
Bounds = Icon5
Disabled=1

[Icon6]
Meter=Image
ImageName=#@#App\#Gamecover6#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(6,1)"]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(6,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(6)"]
MeterStyle=LayoutIcon

[DragNDropChild6]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
OnEnterAction=[!SetVariable Edit 6]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(6)"]
Group=DropGroup
Bounds = Icon6
Disabled=1

[Icon7]
Meter=Image
ImageName=#@#App\#Gamecover7#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(7,1)"]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(7,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(7)"]
MeterStyle=LayoutIcon

[DragNDropChild7]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
OnEnterAction=[!SetVariable Edit 7]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(7)"]
Group=DropGroup
Bounds = Icon7
Disabled=1

[Icon8]
Meter=Image
ImageName=#@#App\#Gamecover8#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(8,1)"]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(8,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(8)"]
MeterStyle=LayoutIcon

[DragNDropChild8]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
OnEnterAction=[!SetVariable Edit 8]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(8)"]
Group=DropGroup
Bounds = Icon8
Disabled=1