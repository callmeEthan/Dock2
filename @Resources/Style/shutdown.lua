function Initialize()
	timer = 5
	text = ""
	header = SKIN:GetVariable('Title','')
end

function shutdown()
	SKIN:Bang("%systemroot%\system32\shutdown.exe -s -t "..timer)
	SKIN:Bang("!ActivateConfig", "#ROOTCONFIG#\\Debug", "shutdown_cancel.ini")
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
		timer = 5
	end
	timer_display()
end

function timer_display()
	local context=''
	if timer > 3600 then
		context = timer/3600 .. " hours"
	elseif timer == 3600 then
		context = timer/3600 .. " hour"
	elseif timer > 60 then
		context = timer/60 .. " minutes"
	elseif timer == 60 then
		context = timer/60 .. " minute"
	elseif timer == 10 then
		context = "10 second (default)"
	else
		context = timer.." seconds"
	end
	SKIN:Bang("!SetVariable","Title",header .. ": "..context)
--	SKIN:Bang("!UpdateMeter","Header")
--	SKIN:Bang("!UpdateMeter","HeaderBackground")
	SKIN:Bang("!UpdateMeterGroup","Header")
	SKIN:Bang("!UpdateMeterGroup","Background")
	SKIN:Bang("!Redraw")
end

function shutdown()
	SKIN:Bang("%systemroot%\\system32\\shutdown.exe /s /f /t "..timer)
	SKIN:Bang("!ActivateConfig", "#ROOTCONFIG#\\Debug", "shutdown_cancel.ini")
end

function restart()
	SKIN:Bang("%systemroot%\\system32\\shutdown.exe /r /t 10")
	SKIN:Bang("!ActivateConfig", "#ROOTCONFIG#\\Debug", "shutdown_cancel.ini")
end

function hibernate()
	SKIN:Bang("rundll32.exe powrprof.dll,SetSuspendState 0,1,0")
end