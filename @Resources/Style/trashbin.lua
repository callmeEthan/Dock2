function Initialize()
	count = tonumber(SKIN:GetVariable('TotalGame'))
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