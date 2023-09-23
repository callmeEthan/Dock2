[Variables]
Title=Timer
TotalGame=3
Directory=#@#App\

Gamecover1=shutdown.png
Gamedir1=[!CommandMeasure "ShutdownScript" "shutdown()"]
Gamename1=Shutdown

Gamecover2=timer_minus.png
Gamedir2=switch:[!CommandMeasure "ShutdownScript" "timer_decrease()"]
Gamename2=Timer -
Hotkey2=DOWN

Gamecover3=timer_add.png
Gamedir3=switch:[!CommandMeasure "ShutdownScript" "timer_increase()"]
Gamename3=Timer +
Hotkey3=UP