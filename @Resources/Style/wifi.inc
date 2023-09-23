[Variables]
wifi=ms-settings:network-wifi						

[WifiStatus]
Measure=Plugin
Plugin=RunCommand
Parameter=netsh interface show interface | findstr /C:"Wi-Fi"
State=Hide
OutputType=ANSI
FinishAction=[!UpdateMeasure #CURRENTSECTION#]
IfMatch=Connected
IfMatchAction=[!CommandMeasure "WifiLua" "wifi_state(1)"]
IfNotMatchAction=[!CommandMeasure "WifiLua" "wifi_state(0)"]

[WifiLua]
Measure=Script
ScriptFile=#@#Style\wifi.lua

[WifiUpdate]
Measure=Plugin
Plugin=ActionTimer
ActionList1=Repeat Update, 1000, 100
Update=[!CommandMeasure "WifiStatus" "Run"]