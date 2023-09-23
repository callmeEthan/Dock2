[Rainmeter]
MouseScrollUpAction=[!CommandMeasure "ShutdownScript" "timer_increase()"]
MouseScrollDownAction=[!CommandMeasure "ShutdownScript" "timer_decrease()"]

[ShutdownScript]
Measure=Script
ScriptFile=#@#Style\shutdown.lua