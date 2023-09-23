function Initialize()
	count = tonumber(SKIN:GetVariable('TotalGame'))
	index = 0
	local i=0
	for i=1, count do
		local dir=SKIN:GetVariable('Gamedir'..i)
		if dir=="function:airplane" then
			index=i
			SKIN:Bang("!CommandMeasure","AirplaneUpdate","Execute 1")
			SKIN:Bang("!SetOption", "Icon"..index, "Greyscale", 1)
			return
		end
	end
end

function airplane_state(state)
	if state==1 then
		SKIN:Bang("!SetOption", "Icon"..index, "Greyscale", 0)
		SKIN:Bang("!UpdateMeter", "Icon"..index)
		SKIN:Bang("!Redraw")
	else
		SKIN:Bang("!SetOption", "Icon"..index, "Greyscale", 1)
		SKIN:Bang("!UpdateMeter", "Icon"..index)
		SKIN:Bang("!Redraw")
	end
end