[Rainmeter]
OnRefreshAction=[!CommandMeasure Animate "set_state(0)"][!ShowMeter Background]
MouseOverAction=[!CommandMeasure Animate "set_state(1)"]
MouseLeaveAction=[!CommandMeasure Animate "highlight(0)"][!CommandMeasure Animate "timer('set')"]
Update=-1
SkinWidth=((#direction#=3)  || (#direction#=4) ? ((ceil(#TotalGame#/#column#)+#Expand#-1)*#size#+(#space#*ceil(#TotalGame#/#column#)) ) : ((min(#TotalGame#,#column#)+#Expand#-0.5)*(#size#+#space#) ))
SkinHeight=((#direction#=3) || (#direction#=4) ? ((min(#TotalGame#,#column#)+#Expand#-0.5)*(#size#+#space#) ) : ((ceil(#TotalGame#/#column#)+#Expand#-1)*#size#+#TextY#+(#space#*ceil(#TotalGame#/#column#)) ) )
;BackgroundMode=2
;SolidColor=255,0,0,200
DynamicWindowSize=0


RightMouseUpAction=!Execute [!SkinCustomMenu]
ContextTitle=Toggle edit
ContextAction=[!CommandMeasure "Animate" "toggle_edit()"]
ContextTitle2=Add icon
ContextAction2=[!CommandMeasure "Animate" "add_icon()"]
ContextTitle3=Remove icon
ContextAction3=[!CommandMeasure "Animate" "remove_icon()"]
ContextTitle4=Rename icon
ContextAction4=[!CommandMeasure "Animate" "rename_icon()"]
ContextTitle5=---
ContextTitle6=Setting file
ContextAction6=["#CURRENTPATH#\Settings.inc"]
ContextTitle7=List file
ContextAction7=["#Applist#"]
ContextTitle8=---
ContextTitle9=Rainmeter Menu
ContextAction9=[!SkinMenu]

[Variables]
Edit_mode=0
bx=0
by=0
bw=0
bh=0


[ScriptRepeatIcon]
Measure=Script
ScriptFile=#@#RepeatSection.lua
ReadFile=#@#Style\grid_layout.inc
WriteFile=#@#Style\grid_meter.inc
Sub=Repeat
Index=1
Limit=(#TotalGame#)


[LayoutIcon]
Meter=Image
X=0
Y=(-#size#-#padding#)
W=#size#
H=#size#
Padding=0,0,0,0
AntiAlias=1
PreserveAspectRatio=1
SolidColor=0,0,0,1
DynamicVariables=1
Group=Icons

[StyleIcon]
Meter=Image
W=#size#
H=#size#
AntiAlias=1
PreserveAspectRatio=1
SolidColor=0,0,0,1
DynamicVariables=1
Group=Icons

[Background]
meter=Image
X=0
Y=0
W=#CURRENTCONFIGWIDTH#
H=#CURRENTCONFIGHEIGHT#
SolidColor=0,0,0,1
MouseOverAction=[!CommandMeasure Animate "set_state(1)"]
UpdateDivider=-1
Hidden=1

[MeterBackground]
Meter=Shape
Shape=Rectangle #bx#, #by#, #bw#, #bh#,(#size#/2)| Fill Color #background# | Stroke Color 0,0,0,0
DynamicVariables=1  
Hidden=1

[DragNDropParent]
Measure=Plugin
Plugin=Drag&Drop
Group=DropGroup
Disabled=1

[Animate]
Measure=Script
ScriptFile=#@#Style\grid_anim.lua

[Animation]
Measure=Plugin
Plugin=ActionTimer
Group=Animation
DynamicVariables=1
ActionList1= Repeat Draw, #update_rate#, #step#
ActionList2= Wait #timeout# | TimerExec
ActionList3= Wait #animspd_init# | StateUpdate
ActionList4= Wait #animspd_enter# | StateUpdate
ActionList5= Wait #animspd_exit# | StateUpdate
ActionList6= DropImage
ActionList7= DropFile
ActionList8= Hide
ActionList9= Lock | Wait #cooldown# | Unlock
ActionList10= Lock
ActionList11= Unlock
ActionList12= End
StateUpdate=[!CommandMeasure Animate "update_state()"]
TimerExec=[!CommandMeasure "Animate" "timer('timeout')"]
Init=[!CommandMeasure "Animate" "show_more()"]
Hide=[!CommandMeasure Animate "set_state(2)"]
Draw=[!CommandMeasure "Animate" "animate()"][!UpdateMeterGroup "Icons"][!UpdateMeasureGroup "DropGroup"][!UpdateMeasureGroup "Extention"][!UpdateMeter "MeterBackground"][!Redraw]
DropImage=[xcopy "#File#" "#Directory#" /y][!WriteKeyValue Variables "Gamecover#Edit#" "#Filename#" "#Applist#"][!SetVariable Gamecover#Edit# #Filename#][!Delay 1000][!SetOption MeterTitle Text "Image added" "#ROOTCONFIG#\Debug"][!SetOption MeterContext Text "#File#" "#ROOTCONFIG#\Debug"][!Delay 500][!UpdateMeterGroup "Icons"][!Redraw]
DropFile=[!WriteKeyValue Variables "Gamedir#Edit#" """["#File#"]""" "#Applist#"][!SetVariable "Gamedir#Edit#" "#File#"][!SetOption MeterTitle Text "Directory added" "#ROOTCONFIG#\Debug"][!SetOption MeterContext Text "#File#" "#ROOTCONFIG#\Debug"]
Lock=[!HideMeter "Background"][!ClickThrough 1]
Unlock=[!ShowMeter "Background"][!ClickThrough #is_subroutine#]
SubroutineEnd=[!CommandMeasure "Animate" "subroutine_end()"]
End=[!Delay (#animspd_exit#*#update_rate#)][!DeactivateConfig "#CURRENTCONFIG#"]