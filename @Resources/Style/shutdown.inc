[Rainmeter]
MouseScrollUpAction=[!CommandMeasure "ShutdownScript" "timer_increase()"]
MouseScrollDownAction=[!CommandMeasure "ShutdownScript" "timer_decrease()"]

[Variables]
TT=10 second

[ShutdownScript]
Measure=Script
ScriptFile=#@#Style\shutdown.lua

[TimerMeter]
Meter=String
StringAlign=CenterBottom
FontFace=Aovel Sans
FontColor=255,255,255
FontSize=15
X=(#CURRENTCONFIGWIDTH#/2)
Y=(#CURRENTCONFIGHEIGHT#+3)
Text=#TT#
AntiAlias=1
DynamicVariables=1
SolidColor=0,0,0,1
Hidden=1