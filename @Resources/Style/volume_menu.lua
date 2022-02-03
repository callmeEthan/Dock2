function Initialize()
	direction = tonumber(SKIN:GetVariable('direction'))
end


function subroutine_init()
	if tonumber(SKIN:GetVariable('is_subroutine')) == 1 then
	hide_icon()
		local iconsize=tonumber(SKIN:GetVariable("IconSize"))
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 1")
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 3")
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 5")
		local d=direction
		local skinx=tonumber(SKIN:GetVariable('CURRENTCONFIGX'))
		local skiny=tonumber(SKIN:GetVariable('CURRENTCONFIGY'))
		SKIN:Bang("!KeepOnScreen", 0)
		if SKIN:GetVariable("CURRENTFILE")=="VolumeControl.ini" then
		local size = tonumber(SKIN:GetVariable('Size'))
			if d==1 then 			SKIN:Bang("!Move", skinx-size-iconsize*0.25, skiny-size*2)
				elseif d==2 then 	SKIN:Bang("!Move", skinx-size-iconsize*0.25, skiny)
				elseif d==3 then 	SKIN:Bang("!Move", skinx-size*2, skiny-size)
				else 			SKIN:Bang("!Move", skinx, skiny-size)
			end
		else
			local w = tonumber(SKIN:GetVariable("CURRENTCONFIGWIDTH"))
			local h = tonumber(SKIN:GetVariable("CURRENTCONFIGHEIGHT"))
			if d==1 then 			SKIN:Bang("!Move", skinx-w/2, skiny-h)
				elseif d==2 then 	SKIN:Bang("!Move", skinx-w/2, skiny)
				elseif d==3 then 	SKIN:Bang("!Move", skinx-w, skiny-h/2)
				else 			SKIN:Bang("!Move", skinx, skiny-h/2)
			end

		end

	elseif tonumber(SKIN:GetVariable('hide_icon'))==1 then
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 1")
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 3")
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 5")
		hide_icon()
	end
	SKIN:Bang("!ShowMeter", "MeterIcon")
	SKIN:Bang("!Update")
	SKIN:Bang("!WriteKeyValue", "Variables", "is_subroutine", 0, "#CURRENTPATH#\\#CURRENTFILE#")
end


function subroutine_end()
	if tonumber(SKIN:GetVariable('is_subroutine')) == 1 then
		SKIN:Bang("!Clickthrough",1)
		local parent=SKIN:GetVariable("Parent")
		SKIN:Bang("!CommandMeasure", "Animate", "timer('resume')", parent)
		SKIN:Bang("!DeactivateConfig", "#CURRENTCONFIG#")
		end
end


function hide_icon()
	if direction == 1 then
		SKIN:Bang("!SetVariable", "HY", 1)
	elseif direction == 2 then
		SKIN:Bang("!SetVariable", "HY", -1)
	elseif direction == 3 then
		SKIN:Bang("!SetVariable", "HX", 1)
	else
		SKIN:Bang("!SetVariable", "HX", -1)
	end		
end

function mouse_press(x,y)
	if SKIN:GetVariable("CURRENTFILE")=="VolumeBar.ini" then
		if direction==1 then
			local v=100-y
			SKIN:Bang("!CommandMeasure", "MeasureWin7Audio", "SetVolume "..v)
		elseif direction==2 then
			local v=y
			SKIN:Bang("!CommandMeasure", "MeasureWin7Audio", "SetVolume "..v)
		elseif direction==3 then
			local v=100-x
			SKIN:Bang("!CommandMeasure", "MeasureWin7Audio", "SetVolume "..v)
		else
			local v=x
			SKIN:Bang("!CommandMeasure", "MeasureWin7Audio", "SetVolume "..v)
		end
	SKIN:Bang("!UpdateMeterGroup", "Animate")
	SKIN:Bang("!Redraw")
	end
end