[IconRepeat]
Meter=Image
ImageName=#@#App\#GamecoverRepeat#
LeftMouseUpAction=!Execute [!CommandMeasure Animate "interact(Repeat,1)"][!SetOption IconRepeat "ImageTint" "255,255,255"][!UpdateMeter IconRepeat][!Redraw]
LeftMouseDownAction=!Execute [!SetOption IconRepeat "ImageTint" "100,100,100"][!UpdateMeter IconRepeat][!Redraw]
MiddleMouseDownAction=!Execute [!CommandMeasure Animate "interact(Repeat,0)"]
MouseOverAction=[!CommandMeasure "Animate" "highlight(Repeat)"][!CommandMeasure ImageDisplay "swap('#BackgroundRepeat#')"]
MeterStyle=LayoutIcon

[DragNDropChildRepeat]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
DynamicVariables=1
Action=Path
ProcessAllFiles=1
OnEnterAction=[!SetVariable Edit Repeat][!CommandMeasure "Animate" "highlight(Repeat)"]
OnDropAction=[!SetVariable File "$File$"][!CommandMeasure Animate "drop_file(Repeat)"]
Group=DropGroup
Bounds = IconRepeat
Disabled=1