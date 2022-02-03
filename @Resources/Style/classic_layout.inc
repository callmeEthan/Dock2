[IconRepeat]
Meter=Image
ImageName=#@#App\#GamecoverRepeat#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(Repeat)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(Repeat)"]
MeterStyle=LayoutIcon

[DragNDropChildRepeat]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
OnEnterAction=[!SetVariable Edit Repeat]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(Repeat)"]
Group=DropGroup
Bounds = IconRepeat
Disabled=1