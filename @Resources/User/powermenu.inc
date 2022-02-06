[Variables]
TotalGame=5
Directory=#@#App\

Gamecover1=shutdown.png
Gamedir1=[!CommandMeasure "ShutdownScript" "shutdown()"]
Gamename1=Shutdown

Gamecover2=timer_minus.png
Gamedir2=switch:[!CommandMeasure "ShutdownScript" "timer_decrease()"]
Gamename2=Timer -

Gamecover3=restart.png
Gamedir3=[!CommandMeasure "ShutdownScript" "restart()"]
Gamename3=Restart

Gamecover4=timer_add.png
Gamedir4=switch:[!CommandMeasure "ShutdownScript" "timer_increase()"]
Gamename4=Timer +

Gamecover5=hibernate.png
Gamedir5=[!CommandMeasure "ShutdownScript" "hibernate()"]
Gamename5=Sleep

