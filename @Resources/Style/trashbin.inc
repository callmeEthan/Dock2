[Variables]
Bin_index=0
trashbin=shell:RecycleBinFolder		
trashbin_alt=[!CommandMeasure "TrashBinUpdate" "Execute 2"]
trashbin_max=100

[TrashBinLua]
Measure=Script
ScriptFile=#@#Style\trashbin.lua
DynamicVariables=1

[TrashBinCount]
Measure=RecycleManager
RecycleType=Count
Drives=All
DynamicVariables=1
OnUpdateAction=[!CommandMeasure "TrashBinLua" "trashbin_check([TrashBinCount])"]

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
ActionList2= ClearBin | Repeat UpdateIntensify, 100, 30 | Update
Update=[!UpdateMeasure TrashBinCount][!CommandMeasure "TrashBinUpdate" "Execute 1"]
ClearBin=[!CommandMeasure "TrashBinUpdate" "Stop 1"][!CommandMeasure TrashBinCount EmptyBin]
UpdateIntensify=[!UpdateMeasure TrashBinCount]
