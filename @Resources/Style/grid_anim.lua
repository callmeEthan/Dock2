function Initialize()
	count = tonumber(SKIN:GetVariable('TotalGame'))
	skinwidth = tonumber(SKIN:GetVariable('CURRENTCONFIGWIDTH'))
	skinheight = tonumber(SKIN:GetVariable('CURRENTCONFIGHEIGHT'))
	divider = SKIN:GetVariable('divider',5)
	direction = tonumber(SKIN:GetVariable('direction',0))
	column = tonumber(SKIN:GetVariable('column',3))
	if direction==1 then
		vertical = 0
		direction = 1
	elseif direction==2 then
		vertical = 0
		direction = -1
	elseif direction==3 then
		vertical = 1
		direction = 1
	else
		vertical = 1
		direction = -1
	end
	state=0
	hide = 0
	show = 0
	swap = 0
	space = tonumber(SKIN:GetVariable('space',0))
	width=tonumber(SKIN:GetVariable('size',50))
	height=tonumber(SKIN:GetVariable('size',50))
	padding=tonumber(SKIN:GetVariable('padding',0))
	expand=tonumber(SKIN:GetVariable('expand',2))
	focus = tonumber(SKIN:GetVariable('focus',1))
	text_y = tonumber(SKIN:GetVariable('TextY',0))
	select=0
	hideicon=tonumber(SKIN:GetVariable('autohide',0))
	SKIN:Bang("!SetOption","Icon"..count+1,"ImageName","#@#App\\new.png")
	SKIN:Bang('!SetVariable','Gamedir'..count+1,'[!CommandMeasure "Animate" "add_icon()"]')
	edit = 0
	edit_entry = 0
	meter = {}
	x = {}
	y = {}
	w = {}
	h = {}
	xto = {}
	yto = {}
	bw = 0
	bh = 0
	meter_name=SKIN:GetMeter('MeterName')
	if vertical == 1 then
	if direction < 0 then start = 0 else start = skinwidth end
	for i=1, count+1 do
		meter[i]=SKIN:GetMeter('Icon'..i)
		if meter[i] == nil then meter[i]=meter[0] end
		xto[i]= (skinwidth/2)+(skinwidth/2)*(direction)
		yto[i]= (skinheight/2)
		y[i]= yto[i]
		x[i]= xto[i]
		w[i] = 0
		h[i] = 0
		SKIN:Bang("!SetOption","Icon"..i, "Padding", padding/2 .. ',' .. padding/2 .. ',' .. padding/2 .. ',' .. padding/2)
		end
	else
	for i=1, count+1 do
	if direction < 0 then start = 0 else start = skinheight end
		meter[i]=SKIN:GetMeter('Icon'..i)
		if meter[i] == nil then meter[i]=meter[0] end
		xto[i]= (skinwidth/2)
		yto[i]= (skinheight/2)+(skinheight/2)*direction
		y[i]= yto[i]
		x[i]= xto[i]
		w[i] = 1
		h[i] = 1
		SKIN:Bang("!SetOption","Icon"..i, "Padding", padding/2 .. ',' .. padding/2 .. ',' .. padding/2 .. ',' .. padding/2)
		end
	end
	SKIN:Bang("!Clickthrough",1)
	bkg=SKIN:GetVariable("background")
	if bkg~=nil then
		SKIN:Bang("!ShowMeter", "MeterBackground")
		bkgwidth=SKIN:GetVariable("background_width",width)
	end
	update_state()
end

function log(x)
	SKIN:Bang("!Log", x)
end

function animate()
	for i=1, show do
		if i == select then
			w[i]=(w[i]-((w[i]-(width*expand-padding))/(divider)))
			h[i]=(h[i]-((h[i]-(height*expand-padding))/(divider)))
			x[i]=(x[i]-((x[i]-xto[i])/(divider)))
			y[i]=(y[i]-((y[i]-yto[i])/(divider)))
			meter[i]:SetX(x[i])
			meter[i]:SetY(y[i])
			meter_name:SetX(x[select]+(w[i]+padding)/2)
			meter_name:SetY(yto[select]+height*expand+text_y)
		else
			if i>hide then
				w[i]=(w[i]-((w[i]-(width-padding))/(divider)))
				h[i]=(h[i]-((h[i]-(height-padding))/(divider)))
			else
				w[i]=(w[i]-((w[i]-0)/(divider)))
				h[i]=(h[i]-((h[i]-0)/(divider)))
			end
			x[i]=(x[i]-((x[i]-xto[i])/(divider+2)))
			y[i]=(y[i]-((y[i]-yto[i])/(divider)))
			meter[i]:SetX(x[i])
			meter[i]:SetY(y[i])
		end
		SKIN:Bang("!SetOption","Icon"..i, "W", w[i])
		SKIN:Bang("!SetOption","Icon"..i, "H", h[i])
		meter[i]:Show()
	end
	if bkg then
		local w=(width+space)*(count-(count-math.min(show,column))+0.5)
		local h=(1+math.floor((show-1)/column))*(height+space)-space
		if select>0 and space==0 then w = w+(expand-1)*width end
		if state == 2 then w = 0 end
		bw = bw - ((bw-w)/divider)
		bh = bh - ((bh-h)/divider)
		if vertical == 0 then
			SKIN:Bang("!SetVariable", "bx", skinwidth/2-bw/2)
			if direction < 0 then
				SKIN:Bang("!SetVariable", "by", (expand-1)*height/2+space)
			else
				SKIN:Bang("!SetVariable", "by", start-(expand-1)*height/2-bh-text_y)
			end
			SKIN:Bang("!SetVariable", "bw", bw)
			SKIN:Bang("!SetVariable", "bh", bh)
		else
			if direction < 0 then
				SKIN:Bang("!SetVariable", "bx", (expand-1)*height/2+space)
			else
				SKIN:Bang("!SetVariable", "bx", start-(expand-1)*height/2-bh )
			end
			SKIN:Bang("!SetVariable", "by", skinheight/2-bw/2)
			SKIN:Bang("!SetVariable", "bw", bh)
			SKIN:Bang("!SetVariable", "bh", bw)
		end
	end
end


function set_state(i)
	if edit == 1 then return end
	if i == 1 then	SKIN:Bang("!CommandMeasure", "Animation", "Stop 2") end
	if state ~= 0 and state ~=i then
		state = i
		update_state()
		SKIN:Bang("!CommandMeasure", "Animation", "Stop 3")
		SKIN:Bang("!CommandMeasure", "Animation", "Stop 4")
		SKIN:Bang("!CommandMeasure", "Animation", "Stop 5")
	end
end

function update_state()
	if state == 0 then
		if show < count then
			show = show+1
			update()
			SKIN:Bang("!CommandMeasure", "Animation", "Execute 3")
			-- if show % column == 0 then state = 3 end
		else
			SKIN:Bang("!Clickthrough",0)
			timer("set")
			state=1
		end
	elseif state == 1 then
		if hide > 0 then
			hide = hide - 1
			update()
			SKIN:Bang("!CommandMeasure", "Animation", "Execute 4")
		end
	elseif state == 2 then
		if hide < count then
			hide = hide + 1
			update()
			SKIN:Bang("!CommandMeasure", "Animation", "Execute 5")
		end
	else
			SKIN:Bang("!CommandMeasure", "Animation", "Execute 3")
			state = 0
	end
end

function update()
	if vertical == 1 then update_vertical() else update_horizonal() end
	SKIN:Bang("!CommandMeasure", "Animation", "Stop 1")
	SKIN:Bang("!CommandMeasure", "Animation", "Execute 1")
end

function update_vertical()
	local row = math.floor((show-1)/column)
	for r=0, row do
		local d = 1
		local xx = 0
		local xr = 0
		local yr = 0
		xr = show % column
		if r < row or xr == 0 then xr=column end
		xx = (skinheight/2) - (xr * (width+space) / 2) + space/2
		if select == 0 then
		for i=(r*column)+1, math.min((r+1)*column,show) do
			if direction < 0 then yr =  space else yr=start-height end
			yr = yr - ((expand-1)*width)/2*direction-(width+space)*(row-r)*direction
			if i <= hide then
				xto[i] = start + width*direction/4
				yto[i] = (skinheight/2)
			else
				xto[i]=yr
				yto[i]=xx
				end
			xx=xx + ((width+space)*(xr-(i % column)))*d
			d = d*(-1)
			end
		else for i=(r*column)+1, math.min((r+1)*column,show) do
			if direction < 0 then yr = space else yr=start-height end
			yr = yr- ((expand-1)*width)/2*direction-(width+space)*(row-r)*direction 
			if i <= hide then
				xto[i] = start + width*direction/4
				yto[i] = (skinheight/2)
			else
				if i == select then
					xto[i]=yr - ((expand-1)*width)/2
					yto[i]=xx - ((expand-1)*width)/2
				else
					xto[i]=yr
					yto[i]=xx
				end
			end
			xx=xx + ((width+space)*(xr-(i % column)))*d
			d = d*(-1)
			end
	end
	end
end

function update_horizonal()
	local row = math.floor((show-1)/column)
	for r=0, row do
		local d = 1
		local xx = 0
		local xr = 0
		local yr = 0
		xr = show % column
		if r < row or xr == 0 then xr=column end
		xx = (skinwidth/2) - (xr * (width+space) / 2) + space/2
		if select == 0 then
		for i=(r*column)+1, math.min((r+1)*column,show) do
			if direction < 0 then yr =  space else yr=start-height end
			yr = yr - ((expand-1)*width)/2*direction-(width+space)*(row-r)*direction - text_y*(direction+1)/2
			if i <= hide then
				xto[i] = (skinwidth/2)
				yto[i] = start + width*direction/4
			else
				xto[i]=xx
				yto[i]=yr
				end
			xx=xx + ((width+space)*(xr-(i % column)))*d
			d = d*(-1)
			end
		else for i=(r*column)+1, math.min((r+1)*column,show) do
			if direction < 0 then yr = space else yr=start-height end
			yr = yr- ((expand-1)*width)/2*direction-(width+space)*(row-r)*direction - text_y*(direction+1)/2
			if i <= hide then
				xto[i] = (skinwidth/2)
				yto[i] = start + width*direction/4
			else
				if i == select then
					xto[i]=xx - ((expand-1)*width)/2
					yto[i]=yr - ((expand-1)*width)/2
				else
					xto[i]=xx
					yto[i]=yr
				end
			end
			xx=xx + ((width+space)*(xr-(i % column)))*d
			d = d*(-1)
			end
	end
	end
end


function highlight(i)
	if i>0 then edit_entry = i end
	if edit == 0 then
		SKIN:Bang("!CommandMeasure", "Animation", "Stop 2")
		select = i
		local n=SKIN:GetVariable("Gamename"..i)
		if n~=nil then 
			SKIN:Bang("!SetOption", "MeterName","Text", "#Gamename"..i.."#")
			SKIN:Bang("!UpdateMeter", "MeterName")
			SKIN:Bang("!ShowMeter","MeterName")
		else
			SKIN:Bang("!HideMeter","MeterName")
		end
		update()
	end
	
end

function toggle_edit(c)
	if state == 0 then return end
	if edit == 0 then
		if state~=1 then set_state(1) end
		edit = 1
		show = count
		hide = 0
		select = 0
		swap = 0
		update()
		SKIN:Bang("!HideMeter","MeterName")
		SKIN:Bang("!SetVariable", "Edit_mode", 1)
		SKIN:Bang("!DisableMeasureGroup", "Extention")
		SKIN:Bang("!EnableMeasureGroup", "DropGroup")
		SKIN:Bang("!ShowMeter","Icon"..count+1)
		SKIN:Bang("!SetOption", "Debug", "Text", "Edit enabled")
		if c~=1 then
		SKIN:Bang("!ActivateConfig", "#ROOTCONFIG#\\Debug", "debug.ini")
		SKIN:Bang("!Move",SKIN:GetX(),SKIN:GetY()+SKIN:GetH(),"#ROOTCONFIG#\\Debug") 
		end
	else 
		edit = 0
		swap = 0
		show = count
		select = 0
		SKIN:Bang("!SetVariable", "Edit_mode", 0)
		SKIN:Bang("!EnableMeasureGroup", "Extention")
		SKIN:Bang("!DisableMeasureGroup", "DropGroup")
		SKIN:Bang("!HideMeter","Icon"..count+1)
		SKIN:Bang("!DeactivateConfig", "#ROOTCONFIG#\\Debug")
		update()
	end
end	

function drop_file(id)
	if edit == 0 then
		return end
	local i =  tonumber(SKIN:GetVariable('Edit'))
	if id ~= i then return end
	SKIN:Bang("!Log", "Dropped file in icon "..i)
	local file = SKIN:GetVariable('File')
	local path,file,extension = SplitFilename(file)
	SKIN:Bang("!SetVariable", "Filename", file)
	SKIN:Bang("!UpdateMeasure", "Animation")
	if (extension == 'png') or (extension == 'jpg') or (extension == 'bmp') or (extension == 'gif') or (extension == 'tif') or (extension == 'ico') then 
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 6")
		if (i == count + 1) then add_icon(file) end
		else
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 7")
		if (i == count + 1) then add_icon() end
		end
end

function SplitFilename(strFilename)
	return string.match(strFilename, "(.-)([^\\]-([^\\%.]+))$")
end

function add_icon(ico)
	SKIN:Bang("!WriteKeyValue", "Variables", 'TotalGame', count+1, "#Applist#")
	if ico == nil then
	SKIN:Bang("!WriteKeyValue", "Variables", 'Gamecover'..count+1, 'unknown.png', "#Applist#")
	else
	SKIN:Bang("!WriteKeyValue", "Variables", 'Gamecover'..count+1, ico, "#Applist#")
	end
	if edit == 1 then SKIN:Bang("!DeactivateConfig", "#ROOTCONFIG#\\Debug") end
	SKIN:Bang("!Refresh")
end

function remove_icon()
	for i=edit_entry, count-1 do
	local Gamecover=SKIN:GetVariable('Gamecover'..i+1)
	local Gamedir=SKIN:GetVariable('Gamedir'..i+1)
	SKIN:Bang("!WriteKeyValue", "Variables", 'Gamecover'..i, Gamecover, "#Applist#")
	SKIN:Bang("!WriteKeyValue", "Variables", 'Gamedir'..i, Gamedir, "#Applist#")
	end
	SKIN:Bang("!WriteKeyValue", "Variables", 'TotalGame', count-1, "#Applist#")
	if edit == 1 then SKIN:Bang("!DeactivateConfig", "#ROOTCONFIG#\\Debug") end
	SKIN:Bang("!Refresh")
end

function rename_icon(i,n)
	if i==nil then
		if edit == 0 then toggle_edit(1) end
		SKIN:Bang("!WriteKeyValue", "Variables", "Parent", "#CURRENTCONFIG#", "#ROOTCONFIGPATH#\\Debug\\rename.ini")
		SKIN:Bang("!WriteKeyValue", "Variables", "Entry", "Gamename"..edit_entry, "#ROOTCONFIGPATH#\\Debug\\rename.ini")
		SKIN:Bang("!WriteKeyValue", "Variables", "Default", SKIN:GetVariable("Gamename"..edit_entry, ""), "#ROOTCONFIGPATH#\\Debug\\rename.ini")
		SKIN:Bang("!ActivateConfig",  "#ROOTCONFIG#\\Debug", "rename.ini")
		SKIN:Bang("!Move",SKIN:GetX(),SKIN:GetY()+SKIN:GetH(),"#ROOTCONFIG#\\Debug")
	else
		SKIN:Bang("!WriteKeyValue", "Variables", i, n, "#Applist#")
		SKIN:Bang("!SetVariable", i, n)
		SKIN:Bang("!UpdateMeterGroup", "Icons")
		SKIN:Bang("!Redraw")
	end
end

function interact(index)
	if edit == 1 and index <= count then
		if swap == 0 then select=index else select=0 end
		update()
		SKIN:Bang("!SetOption", "MeterTitle", "Text", "Icon select", "#ROOTCONFIG#\\Debug")
		SKIN:Bang("!SetOption", "MeterContext", "Text", "Select another icon to swap icon position.", "#ROOTCONFIG#\\Debug")
		if swap == 0 then swap = index else swap_icon(swap, index) end
	return end

	local command=SKIN:GetVariable('Gamedir'..index)

	if string.match(command, 'switch:') then 
		command = string.sub(command,8)
		SKIN:Bang(command)
		return
	elseif string.match(command, 'submenu:') then 
		sub_menu(command,index)
		return
	elseif string.match(command, 'function:') then 
		command = string.sub(command,10)
		SKIN:Bang(SKIN:GetVariable(command))
	elseif string.match(command, '%[') then
		SKIN:Bang(command)
	else
		SKIN:Bang('"'..command..'"')
	end
	subroutine_end()
	highlight(0)
	if hideicon == 1 then set_state(2) end
	SKIN:Bang("!CommandMeasure", "Animation", "Execute 9")
end

function swap_icon(a,b)
	if a==b then 
		SKIN:Bang("!SetOption", "MeterContext", "Text", "Select an icon to swap position", "#ROOTCONFIG#\\Debug")
		swap=0
		select=0
		update()
		end
	local temp_icon=SKIN:GetVariable('Gamecover'..b)
	local temp_dir=SKIN:GetVariable('Gamedir'..b)
	local temp_name=SKIN:GetVariable('Gamename'..b)

	SKIN:Bang("!WriteKeyValue", "Variables", "Gamecover"..a, SKIN:GetVariable("Gamecover"..b), SKIN:GetVariable("Applist"))
	SKIN:Bang("!WriteKeyValue", "Variables", "Gamedir"..a, SKIN:GetVariable("Gamedir"..b), SKIN:GetVariable("Applist"))
	if temp_name~=nul then SKIN:Bang("!WriteKeyValue", "Variables", "Gamename"..a, SKIN:GetVariable("Gamename"..b), SKIN:GetVariable("Applist")) end

	SKIN:Bang("!WriteKeyValue", "Variables", "Gamecover"..b, SKIN:GetVariable("Gamecover"..a), SKIN:GetVariable("Applist"))
	SKIN:Bang("!WriteKeyValue", "Variables", "Gamedir"..b, SKIN:GetVariable("Gamedir"..a), SKIN:GetVariable("Applist"))
	if temp_name~=nul then SKIN:Bang("!WriteKeyValue", "Variables", "Gamename"..b, SKIN:GetVariable("Gamename"..a), SKIN:GetVariable("Applist")) end

	SKIN:Bang('!SetVariable', 'Gamecover'..b, SKIN:GetVariable('Gamecover'..a))
	SKIN:Bang('!SetVariable', 'Gamedir'..b, SKIN:GetVariable('Gamedir'..a))
	if temp_name~=nul then SKIN:Bang('!SetVariable', 'Gamename'..b, SKIN:GetVariable('Gamename'..a)) end

	SKIN:Bang('!SetVariable', 'Gamecover'..a, temp_icon)
	SKIN:Bang('!SetVariable', 'Gamedir'..a, temp_dir)
	if temp_name~=nul then SKIN:Bang('!SetVariable', 'Gamename'..a, temp_name) end
	SKIN:Bang("!SetOption", "MeterTitle", "Text", "Icon select", "#ROOTCONFIG#\\Debug")
	SKIN:Bang("!SetOption", "MeterContext", "Text", "Icon position swapped#CRLF#Drag and drop file or image into the icons, Press (+) to add icon", "#ROOTCONFIG#\\Debug")
	update()
	swap=0
end

function sub_menu(command,index)
	local s=command:match("%[(.-)%]")
	local cfg="Dock.ini"
	if s~=nil then
		command = command:gsub('%b[]', '')
		cfg = s
	end
	SKIN:Bang("!WriteKeyValue", "Variables", "is_subroutine", "1", string.sub (command, 9) .. "\\"..cfg)
	SKIN:Bang("!WriteKeyValue", "Variables", "Parent", "#CURRENTCONFIG#", string.sub (command, 9) .. "\\"..cfg)
	SKIN:Bang("!WriteKeyValue", "Variables", "direction", SKIN:GetVariable('direction'), string.sub (command, 9) .. "\\Settings.inc")
	SKIN:Bang("!ActivateConfig","#ROOTCONFIG#\\".. string.sub (command, 9), cfg)
	local xstart = 0
	local ystart = 0
	local d=tonumber(SKIN:GetVariable('direction'))
	if d==1 then
		xstart=SKIN:GetVariable('CURRENTCONFIGX') + xto[index] + width*expand/2
		if focus==1 then ystart=SKIN:GetVariable('CURRENTCONFIGY') + yto[index] + h[index]
		else
		ystart=SKIN:GetVariable('CURRENTCONFIGY')
		end
	elseif d==2 then
		xstart=SKIN:GetVariable('CURRENTCONFIGX') + xto[index] + width*expand/2
		if focus==1 then ystart=SKIN:GetVariable('CURRENTCONFIGY') + yto[index]
		else
		ystart=SKIN:GetVariable('CURRENTCONFIGY') + skinheight
		end
	elseif d==3 then
		if focus==1 then xstart=SKIN:GetVariable('CURRENTCONFIGX') + xto[index] + w[index]
		else
		xstart=SKIN:GetVariable('CURRENTCONFIGX') 
		end
		ystart=SKIN:GetVariable('CURRENTCONFIGY') + yto[index] + height*expand/2
	else	
		if focus == 1 then xstart=SKIN:GetVariable('CURRENTCONFIGX') + xto[index]
		else
		xstart=SKIN:GetVariable('CURRENTCONFIGX') + skinwidth
		end
		ystart=SKIN:GetVariable('CURRENTCONFIGY') + yto[index] + height*expand/2
	end
	SKIN:Bang("!Move" ,xstart ,ystart , "#ROOTCONFIG#\\".. string.sub (command, 9))
	if focus == 1 then
	SKIN:Bang("!ClickThrough", "1")
	highlight(0)
	set_state(2)
	SKIN:Bang("!CommandMeasure", "Animation", "Execute 10")
	end
end

function subroutine_init()
	if tonumber(SKIN:GetVariable('is_subroutine')) == 1 then
		local d=tonumber(SKIN:GetVariable('direction'))
		local skinx=tonumber(SKIN:GetVariable('CURRENTCONFIGX'))
		local skiny=tonumber(SKIN:GetVariable('CURRENTCONFIGY'))
		SKIN:Bang("!KeepOnScreen", 0)
		if d==1 then
			SKIN:Bang("!Move", skinx-(skinwidth/2), skiny-skinheight+space)
		elseif d==2 then
			SKIN:Bang("!Move", skinx-(skinwidth/2), skiny-space)
		elseif d==3 then
			SKIN:Bang("!Move", skinx-skinwidth+space, skiny-(skinheight/2))
		else
			SKIN:Bang("!Move", skinx-space, skiny-(skinheight/2))
		end
	SKIN:Bang("!WriteKeyValue", "Variables", "is_subroutine", 2, "#CURRENTPATH#\\#CURRENTFILE#")
	end
end

function subroutine_end()
	if edit == 1 then return end
	if tonumber(SKIN:GetVariable('is_subroutine')) > 0 then
		SKIN:Bang("!Clickthrough",1)
		local parent=SKIN:GetVariable("Parent")
		SKIN:Bang("!CommandMeasure", "Animate", "timer('resume')", parent)
		set_state(2)
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 12")
		end
end


function timer(c)
	if c == "set" and hideicon == 1 then
		SKIN:Bang("!CommandMeasure", "Animation", "Stop 2")
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 2")
	elseif c=="timeout" then
		subroutine_end()
		set_state(2)
	elseif c=="resume" and focus==1 then
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 9")
		if hideicon == 0 then set_state(1) end
	end
end
