[Variables]
bluetooth=ms-settings:bluetooth						

[BluetoothStatus]
Measure=Plugin
Plugin=RunCommand
Parameter=reg.exe query "HKLM\SYSTEM\CurrentControlSet\Services\bthserv\Parameters\BluetoothControlPanelTasks" /v "state"
State=Hide
OutputType=ANSI
FinishAction=[!UpdateMeasure #CURRENTSECTION#]
IfMatch=0x1
IfMatchAction=[!CommandMeasure "BluetoothLua" "bluetooth_state(1)"]
IfNotMatchAction=[!CommandMeasure "BluetoothLua" "bluetooth_state(0)"]

[BluetoothLua]
Measure=Script
ScriptFile=#@#Style\bluetooth.lua

[BluetoothUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Repeat Update, 1000, 100
Update=[!CommandMeasure "BluetoothStatus" "Run"]