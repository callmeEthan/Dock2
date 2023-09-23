function Initialize()
	count = tonumber(SKIN:GetVariable('TotalGame'))
	maximum = tonumber(SKIN:GetVariable('trashbin_max','1'))
	trash = 0
	index = 0
	local i=0
	for i=1, count do
		local dir=SKIN:GetVariable('Gamedir'..i)
		if dir=="function:trashbin" then
			index=i
			SKIN:Bang("!Log", "Trash Bin function detected, index="..i..", enabling DragNDrop")
			SKIN:Bang("!SetVariable","Bin_index",index)
			SKIN:Bang("!WriteKeyValue", "DragNDropTrashChild" ,"Bounds", "Icon"..index, "#@#Style\\trashbin.inc")
			SKIN:Bang("!EnableMeasure","DragNDropTrashChild")
			SKIN:Bang("!DisableMeasureGroup","DropGroup")
			SKIN:Bang("!CommandMeasure","TrashBinUpdate","Execute 1")
			SKIN:Bang("!ShowMeter","Icon"..index)
			return
		end
	end
end

function delete_file()
	local t=tonumber(SKIN:GetVariable('Edit_mode'))
	if t==0 then	
		SKIN:Bang("!Log", "Edit mode "..t)
		local file=SKIN:GetVariable("File")
		SKIN:Bang("!Log", 'Delete "'..file..'"')
		SKIN:Bang('"#@#Recycle.exe" "'..file..'"')
	end
end

function trashbin_check(item)
	if trash == item then return end
	if (item/maximum == 0) then
		SKIN:Bang("!SetVariable", "Gamecover"..index, "trashbin_empty.png")
		SKIN:Bang("!UpdateMeterGroup", "Icons")
		SKIN:Bang("!Redraw")
	elseif (item/maximum <= 0.25) then
		SKIN:Bang("!SetVariable", "Gamecover"..index, "trashbin_25.png")
		SKIN:Bang("!UpdateMeterGroup", "Icons")
		SKIN:Bang("!Redraw")
	elseif (item/maximum <= 0.5) then
		SKIN:Bang("!SetVariable", "Gamecover"..index, "trashbin_50.png")
		SKIN:Bang("!UpdateMeterGroup", "Icons")
		SKIN:Bang("!Redraw")
	elseif (item/maximum <= 0.75) then
		SKIN:Bang("!SetVariable", "Gamecover"..index, "trashbin_75.png")
		SKIN:Bang("!UpdateMeterGroup", "Icons")
		SKIN:Bang("!Redraw")
	else
		SKIN:Bang("!SetVariable", "Gamecover"..index, "trashbin.png")
		SKIN:Bang("!UpdateMeterGroup", "Icons")
		SKIN:Bang("!Redraw")
	end
	trash = item
end