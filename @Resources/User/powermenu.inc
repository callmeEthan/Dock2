[Variables]
Title=Power
TotalGame=3
Directory=#@#App\

Gamecover1=shutdown.png
Gamedir1=submenu:ShutdownTimer
Gamename1=Shutdown

Gamecover2=restart.png
Gamedir2=[!CommandMeasure "ShutdownScript" "restart()"]
Gamename2=Restart

Gamecover3=sleep.png
Gamedir3=[!CommandMeasure "ShutdownScript" "hibernate()"]
Gamename3=Sleep

