[Variables]
airplane=ms-settings:network-airplanemode					

[AirplaneStatus]
Measure=Plugin
Plugin=RunCommand
Parameter=reg.exe query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\RadioManagement\SystemRadioState"
State=Hide
OutputType=ANSI
FinishAction=[!UpdateMeasure #CURRENTSECTION#]
IfMatch=0x1
IfMatchAction=[!CommandMeasure "AirplaneLua" "airplane_state(1)"]
IfNotMatchAction=[!CommandMeasure "AirplaneLua" "airplane_state(0)"]

[AirplaneLua]
Measure=Script
ScriptFile=#@#Style\airplane.lua

[AirplaneUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Repeat Update, 1000, 100
Update=[!CommandMeasure "AirplaneStatus" "Run"]