[Icon1]
Meter=Image
ImageName=#@#App\#Gamecover1#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(1)"]
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
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(2)"]
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
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(3)"]
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
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(4)"]
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
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(5)"]
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