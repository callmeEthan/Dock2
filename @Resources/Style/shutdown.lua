function Initialize()
	timer = 10
	text = ""
end

function shutdown()
	SKIN:Bang("%systemroot%\system32\shutdown.exe -s -t "..timer)
	SKIN:Bang("!ActivateConfig", "#ROOTCONFIG#\Debug", "shutdown_cancel.ini")
end

function timer_increase()
	if timer >= 3600 then
		timer = timer + 3600
	elseif timer >= 600 then
		timer = timer + 300
	elseif timer >= 60 then
		timer = timer + 60
	else
		timer = 60
	end
	timer_display()
end

function timer_decrease()
	if timer > 3600 then
		timer = timer - 3600
	elseif timer > 600 then
		timer = timer - 300
	elseif timer > 60 then
		timer = timer - 60
	else
		timer = 10
	end
	timer_display()
end

function timer_display()
	if timer > 3600 then
		SKIN:Bang("!SetOption", "TimerMeter", "Text", timer/3600 .. " hours")
	elseif timer == 3600 then
		SKIN:Bang("!SetOption", "TimerMeter", "Text", timer/3600 .. " hour")
	elseif timer > 60 then
		SKIN:Bang("!SetOption", "TimerMeter", "Text", timer/60 .. " minutes")
	elseif timer == 60 then
		SKIN:Bang("!SetOption", "TimerMeter", "Text", timer/60 .. " minute")
	elseif timer == 10 then
		SKIN:Bang("!SetOption", "TimerMeter", "Text", "10 second (default)")
	else
		SKIN:Bang("!SetOption", "TimerMeter", "Text", timer.." seconds")
	end
	SKIN:Bang("!ShowMeter", "TimerMeter")
	SKIN:Bang("!UpdateMeter","TimerMeter")
	SKIN:Bang("!Redraw")
end

function shutdown()
	SKIN:Bang("%systemroot%\\system32\\shutdown.exe /s /t "..timer)
	SKIN:Bang("!ActivateConfig", "#ROOTCONFIG#\\Debug", "shutdown_cancel.ini")
end

function restart()
	SKIN:Bang("%systemroot%\\system32\\shutdown.exe /r /t "..timer)
	SKIN:Bang("!ActivateConfig", "#ROOTCONFIG#\\Debug", "shutdown_cancel.ini")
end

function hibernate()
	SKIN:Bang("rundll32.exe powrprof.dll,SetSuspendState 0,1,0")
end