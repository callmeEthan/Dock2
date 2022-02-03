[Variables]
TotalGame=5
Directory=#@#App\

Gamecover1=shutdown.png
Gamedir1=[!CommandMeasure "ShutdownScript" "shutdown()"]

Gamecover2=timer_minus.png
Gamedir2=switch:[!CommandMeasure "ShutdownScript" "timer_decrease()"]

Gamecover3=restart.png
Gamedir3=[!CommandMeasure "ShutdownScript" "restart()"]

Gamecover4=timer_add.png
Gamedir4=switch:[!CommandMeasure "ShutdownScript" "timer_increase()"]

Gamecover5=hibernate.png
Gamedir5=[!CommandMeasure "ShutdownScript" "hibernate()"]

