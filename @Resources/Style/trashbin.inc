[Variables]
Bin_index=0
trashbin=shell:RecycleBinFolder										

[TrashBinLua]
Measure=Script
ScriptFile=#@#Style\trashbin.lua
DynamicVariables=1



[TrashBinCount]
Measure=Plugin
Plugin=RecycleManager.dll
RecycleType=Count
Drives=All
IfCondition=TrashBinCount > 0
DynamicVariables=1
IfTrueAction=[!SetVariable "Gamecover#Bin_index#" "trashbin.png"][!UpdateMeterGroup "Icons"][!Redraw]
IfFalseAction=[!SetVariable "Gamecover#Bin_index#" "trashbin_empty.png"][!UpdateMeterGroup "Icons"][!Redraw]


[DragNDropTrashChild]
Measure=Plugin
Plugin=Drag&Drop
Parent=DragNDropParent
Group=Extention
Bounds=Icon4 
Silent=1
ProcessAllFiles=1
Action=Path
OnEnterAction=[!CommandMeasure "Animate" "highlight(#Bin_index#)"]
OnLeaveAction=[!CommandMeasure "Animate" "highlight(0)"]
OnDropAction=[!SetVariable "File" "$File$"][!CommandMeasure "TrashBinLua" "delete_file()"][!Delay 200][!UpdateMeasure TrashBinCount]
Disabled=1
DynamicVariables=1

[TrashBinUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1= Wait 1000 | Update
Update=[!UpdateMeasure TrashBinCount][!CommandMeasure "TrashBinUpdate" "Execute 1]
