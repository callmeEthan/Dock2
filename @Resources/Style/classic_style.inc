[Rainmeter]
OnRefreshAction=[!CommandMeasure Animate "set_state(0)"][!ShowMeter Background]
MouseLeaveAction=[!CommandMeasure Animate "highlight(0)"][!CommandMeasure Animate "timer('set')"][!CommandMeasure Animation "Execute 15"]
Update=-1
SkinWidth=((#direction#=3)  || (#direction#=4) ? (#TextW#+#expand#*#size#) : (#TextW#+#TotalGame#*(#size#+#space#)+#expand#*#size#))
SkinHeight=((#direction#=3) || (#direction#=4) ? (#TotalGame#*(#size#+#space#)+#expand#*#size#+#TextY#) : (#expand#*#size#+#TextY#))
DynamicWindowSize=0
;BackgroundMode=2
;SolidColor=255,0,0,200

RightMouseUpAction=!Execute [!SkinCustomMenu]
ContextTitle=Toggle edit
ContextAction=[!CommandMeasure "Animate" "toggle_edit()"]
ContextTitle2=Remove icon
ContextAction2=[!CommandMeasure "Animate" "remove_icon()"]
ContextTitle3=Rename icon
ContextAction3=[!CommandMeasure "Animate" "rename_icon()"]
ContextTitle4=---
ContextTitle5=Global Setting file
ContextAction5=["#@#\Global.Settings.inc"]
ContextTitle6=Setting file
ContextAction6=["#CURRENTPATH#\Settings.inc"]
ContextTitle7=List file
ContextAction7=["#Applist#"]
ContextTitle8=---
ContextTitle9=Light mode
ContextAction9=[!WriteKeyValue "Variables" "background" "245,245,245" "#@#Global.Settings.inc"][!WriteKeyValue "Variables" "FontColor" "0,0,0" "#@#Global.Settings.inc"][!WriteKeyValue "Variables" "TextBackground" "255,255,255" "#@#Global.Settings.inc"][!Refresh]
ContextTitle10=Dark mode
ContextAction10=[!WriteKeyValue "Variables" "background" "15,15,15" "#@#Global.Settings.inc"][!WriteKeyValue "Variables" "FontColor" "255,255,255" "#@#Global.Settings.inc"][!WriteKeyValue "Variables" "TextBackground" "0,0,0" "#@#Global.Settings.inc"][!Refresh]
ContextTitle11=---
ContextTitle12=Update meter && hotkeys
ContextAction12=[!WriteKeyValue "Variables" "update_list" "1" "#@#\\Global.Settings.inc"][!Refresh]
ContextTitle13=Rainmeter Menu
ContextAction13=[!SkinMenu]

[Variables]
Edit_mode=0
bx=0
by=0
bw=0
bh=0
Lock=0

[ScriptRepeatIcon]
Measure=Script
ScriptFile=#@#RepeatSection.lua
HotkeyFile=#@#Style\hotkey_layout.inc
ReadFile=#@#Style\classic_layout.inc
WriteFile=#@#Style\classic_meter.inc
Sub=Repeat
Index=1
Limit=(#TotalGame#+1)

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

[DragNDropParent]
Measure=Plugin
Plugin=Drag&Drop
Group=DropGroup
Disabled=1

[Animate]
Measure=Script
ScriptFile=#@#Style\classic_anim.lua

[ActiveConfig]
Measure=Plugin
Plugin=ConfigActive
DynamicVariables=1
ConfigName=#check_config#

[ImageDisplay]
Measure=Script
ScriptFile=#@#Style\ImageDisplay.lua
DynamicVariables=1

[Animation]
Measure=Plugin
Plugin=ActionTimer
Group=Animation
DynamicVariables=1
ActionList1= Repeat Draw, #update_rate#, #step# | AnimEnd
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
ActionList13= ForceAnim
ActionList14= LoadImage
ActionList15= Wait 1000 | DismissImage
ActionList16= Wait #timeout# | ResetPos
StateUpdate=[!CommandMeasure Animate "update_state()"]
TimerExec=[!CommandMeasure "Animate" "timer('timeout')"]
Init=[!CommandMeasure "Animate" "show_more()"]
Hide=[!CommandMeasure Animate "set_state(2)"]
Draw=[!CommandMeasure "Animate" "animate()"][!UpdateMeterGroup "Icons"][!UpdateMeasureGroup "DropGroup"][!UpdateMeasureGroup "Extention"][!UpdateMeterGroup "Background"][!Redraw]
DropImage=[xcopy "#File#" "#Directory#" /y][!WriteKeyValue Variables "Gamecover#Edit#" "#Filename#" "#Applist#"][!SetVariable Gamecover#Edit# #Filename#][!Delay 1000][!SetOption MeterTitle Text "Image added" "#ROOTCONFIG#\Debug"][!SetOption MeterContext Text "#File#" "#ROOTCONFIG#\Debug"][!Delay 500][!UpdateMeterGroup "Icons"][!Redraw]
DropFile=[!WriteKeyValue Variables "Gamedir#Edit#" """["#File#"]""" "#Applist#"][!SetVariable "Gamedir#Edit#" "#File#"][!SetOption MeterTitle Text "Directory added" "#ROOTCONFIG#\Debug"][!SetOption MeterContext Text "#File#" "#ROOTCONFIG#\Debug"]
Lock=[!HideMeter "Background"][!ClickThrough 1][!SetVariable Lock 1]
Unlock=[!ShowMeter "Background"][!ClickThrough #is_subroutine#][!SetVariable Lock 0]
SubroutineEnd=[!CommandMeasure "Animate" "subroutine_end()"]
End=[!Delay (#animspd_exit#*#update_rate#*#TotalGame#/2)][!DeactivateConfig "#CURRENTCONFIG#"]
ForceAnim=[!CommandMeasure "Animate" "force_animate()"]
LoadImage=[!CommandMeasure ImageDisplay "activate_config()"]
DismissImage=[!CommandMeasure ImageDisplay "deactivate_config()"]
ResetPos=[!ZPos #position#][!CommandMeasure "Animate" "deactivate_hotkey()"]
AnimEnd=[!CommandMeasure "Animate" "animate_end()"]