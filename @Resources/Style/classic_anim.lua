function Initialize()
	count = tonumber(SKIN:GetVariable('TotalGame'))
	skinwidth = tonumber(SKIN:GetVariable('CURRENTCONFIGWIDTH'))
	skinheight = tonumber(SKIN:GetVariable('CURRENTCONFIGHEIGHT'))
	divider = SKIN:GetVariable('divider',5)
	direction = tonumber(SKIN:GetVariable('direction',0))
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
	text_w = tonumber(SKIN:GetVariable('TextW',0))
	select=0
	ConfigMeasure = SKIN:GetMeasure('ActiveConfig')
	hideicon=tonumber(SKIN:GetVariable('autohide',0))
	SKIN:Bang("!SetOption","Icon"..count+1,"ImageName","#@#App\\new.png")
	SKIN:Bang("!SetOption","Icon"..count+1,"ImageTint",SKIN:GetVariable("FontColor"))
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
	meter_name=SKIN:GetMeter('MeterName')
	if vertical == 1 then
	if direction < 0 then start = -height else start = skinwidth end
	for i=1, count+1 do
		meter[i]=SKIN:GetMeter('Icon'..i)
		if meter[i] == nil then meter[i]=meter[0] end
		xto[i]= -width+(skinwidth/2)+(skinwidth/2)*(1+direction)
		yto[i]= (skinheight/2)
		y[i]= yto[i]
		x[i]= xto[i]
		w[i] = 0
		h[i] = 0
		SKIN:Bang("!SetOption","Icon"..i, "Padding", padding/2 .. ',' .. padding/2 .. ',' .. padding/2 .. ',' .. padding/2)
		end
	else
	for i=1, count+1 do
	if direction < 0 then start = -height else start = skinheight end
		meter[i]=SKIN:GetMeter('Icon'..i)
		if meter[i] == nil then meter[i]=meter[0] end
		xto[i]= (skinwidth/2)
		yto[i]= -height+(skinheight/2)+(skinheight/2)*(1+direction)
		y[i]= yto[i]
		x[i]= xto[i]
		w[i] = 1
		h[i] = 1
		SKIN:Bang("!SetOption","Icon"..i, "Padding", padding/2 .. ',' .. padding/2 .. ',' .. padding/2 .. ',' .. padding/2)
		end
	end
	SKIN:Bang("!Clickthrough",1)
	SKIN:Bang("!ZPos", SKIN:GetVariable("position"))
	bkg=SKIN:GetVariable("background")
	bkg_hide=0
	if bkg~=nil then
		SKIN:Bang("!ShowMeter", "MeterBackground")
		bkgwidth=SKIN:GetVariable("background_width",width)
	end
	last_submenu=nil
	check_edge_activate()
	update_state()
	enable_hotkey = tonumber(SKIN:GetVariable('enable_hotkey',0))
	hotkey_count = tonumber(SKIN:GetVariable('HotkeyCount',0))
	if enable_hotkey == 0 then SKIN:Bang("!CommandMeasure", "HotkeyMain", "Stop") end
	log("Hotkey found: "..hotkey_count)
end

function log(x)
	SKIN:Bang("!Log", x)
end

function check_edge_activate()
	local edge = tonumber(SKIN:GetVariable('edge_activate',0))
	if edge == 0 then return end
	if vertical == 0 then
		if direction==1 then
			log("Edge activate: bottom edge")
			SKIN:Bang("!SetOption", "Background", "Y", "(#CURRENTCONFIGHEIGHT#-"..edge..")")
			SKIN:Bang("!SetOption", "Background", "H", edge)
			SKIN:Bang("!UpdateMeter", "Background")
		else
			log("Edge activate: top edge")
			SKIN:Bang("!SetOption", "Background", "Y", "0")
			SKIN:Bang("!SetOption", "Background", "H", edge)
			SKIN:Bang("!UpdateMeter", "Background")
		end
	else
		if direction==1 then
			log("Edge activate: right edge")
			SKIN:Bang("!SetOption", "Background", "X", "(#CURRENTCONFIGWIDTH#-"..edge..")")
			SKIN:Bang("!SetOption", "Background", "W", edge)
			SKIN:Bang("!UpdateMeter", "Background")
		else
			log("Edge activate: left edge")
			SKIN:Bang("!SetOption", "Background", "X", "0")
			SKIN:Bang("!SetOption", "Background", "W", edge)
			SKIN:Bang("!UpdateMeter", "Background")
		end
	end
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
			w[i]=(w[i]-((w[i]-(width-padding))/(divider)))
			h[i]=(h[i]-((h[i]-(height-padding))/(divider)))
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
		local w=(width+space)*(count-(count-show)+0.5)
		if select>0 and space==0 then w = w+(expand-1)*width end
		if state == 2 then w = 0 end
		bw = bw - ((bw-w)/divider)
		if vertical == 0 then
			SKIN:Bang("!SetVariable", "bx", skinwidth/2-bw/2)
			SKIN:Bang("!SetVariable", "by", ((expand-1)*width)/2)
			SKIN:Bang("!SetVariable", "bw", bw)
			SKIN:Bang("!SetVariable", "bh", bkgwidth)
		else
			SKIN:Bang("!SetVariable", "bx", skinwidth/2-bkgwidth/2)
			SKIN:Bang("!SetVariable", "by", skinheight/2-bw/2)
			SKIN:Bang("!SetVariable", "bw", bkgwidth)
			SKIN:Bang("!SetVariable", "bh", bw)
		end
		if bw<1 and bkg_hide==0 then
			SKIN:Bang("!HideMeterGroup","Background")
			bkg_hide=1
		elseif bw>1 and bkg_hide==1 then
			SKIN:Bang("!ShowMeterGroup","Background")
			bkg_hide=0
		end
	end
end

function animate_end()
	if state == 2 then
		SKIN:Bang("!ZPos", SKIN:GetVariable("position"))
	end
end

function force_animate()
	if state == 0 then show = count
	elseif state == 1 then hide = 0
	else hide = count end
	SKIN:Bang("!CommandMeasure", "Animation", "Stop 1")
	SKIN:Bang("!CommandMeasure", "Animation", "Stop 2")
	SKIN:Bang("!CommandMeasure", "Animation", "Stop 3")
	SKIN:Bang("!CommandMeasure", "Animation", "Stop 4")
	SKIN:Bang("!CommandMeasure", "Animation", "Stop 5")
	for i=1, show do
		if i == select then
			w[i]=width*expand-padding
			h[i]=height*expand-padding
			x[i]=xto[i]
			y[i]=y[to]
			meter[i]:SetX(x[i])
			meter[i]:SetY(y[i])
			meter_name:SetX(x[select]+(w[i]+padding)/2)
			meter_name:SetY(yto[select]+height*expand+text_y)
		else
			w[i]=width-padding
			h[i]=height-padding
			x[i]=xto[i]
			y[i]=yto[i]
			meter[i]:SetX(x[i])
			meter[i]:SetY(y[i])
		end
		SKIN:Bang("!SetOption","Icon"..i, "W", w[i])
		SKIN:Bang("!SetOption","Icon"..i, "H", h[i])
		meter[i]:Show()
	end
	if bkg then
		local w=(width+space)*(count-(count-show)+0.5)
		if select>0 and space==0 then w = w+(expand-1)*width end
		if state == 2 then w = 0 end
		bw = bw - ((bw-w)/divider)
		if vertical == 0 then
			SKIN:Bang("!SetVariable", "bx", skinwidth/2-bw/2)
			SKIN:Bang("!SetVariable", "by", ((expand-1)*width)/2)
			SKIN:Bang("!SetVariable", "bw", bw)
			SKIN:Bang("!SetVariable", "bh", bkgwidth)
		else
			SKIN:Bang("!SetVariable", "bx", skinwidth/2-bkgwidth/2)
			SKIN:Bang("!SetVariable", "by", skinheight/2-bw/2)
			SKIN:Bang("!SetVariable", "bw", bkgwidth)
			SKIN:Bang("!SetVariable", "bh", bw)
		end
	end
	SKIN:Bang("!CommandMeasure", "Animation", "Execute 9")
end


function set_state(i)
	if edit == 1 then return end
	if i == 1 then 
		SKIN:Bang("!CommandMeasure", "Animation", "Stop 2")
		activate_hotkey()
		else
		deactivate_hotkey()
	end
	if state ~= 0 and state ~=i then
		state = i
		update_state()
		SKIN:Bang("!CommandMeasure", "Animation", "Stop 3")
		SKIN:Bang("!CommandMeasure", "Animation", "Stop 4")
		SKIN:Bang("!CommandMeasure", "Animation", "Stop 5")
	end
	if state == 2 then
		SKIN:Bang("!ClickThroughGroup", "Icons", 1)
		SKIN:Bang("!ClickThroughGroup", "Background", 1)
		SKIN:Bang("!ClickThroughGroup", "DropGroup", 1)
	else
		SKIN:Bang("!ClickThroughGroup", "Icons", 0)
		SKIN:Bang("!ClickThroughGroup", "Background", 0)
		SKIN:Bang("!ClickThroughGroup", "DropGroup", 0)
	end
end

function update_state()
	if state == 0 then
		if show < count then
			show = show+1
			update()
			SKIN:Bang("!CommandMeasure", "Animation", "Execute 3")
		else
			SKIN:Bang("!Clickthrough",0)
			timer("set")
			state=1
			activate_hotkey()
		end
	elseif state == 1 then
		if hide > 0 then
			hide = hide - 1
			update()
			SKIN:Bang("!CommandMeasure", "Animation", "Execute 4")
		end
	else
		if hide < count then
			hide = hide + 1
			update()
			SKIN:Bang("!CommandMeasure", "Animation", "Execute 5")
		end
	end
end

function update()
	if vertical == 1 then update_vertical() else update_horizonal() end
	SKIN:Bang("!CommandMeasure", "Animation", "Stop 1")
	SKIN:Bang("!CommandMeasure", "Animation", "Execute 1")
end

function update_vertical()
	local xs = 0
	if (select % 2 == 0) then xs = (show-select)/2 else xs = -(show-select)/2 end
	local xx = (skinheight/2) - (show * (height+space) / 2) + space/2
	local d = 1
	if select == 0 then
	for i=1, show do
		if i <= hide then xto[i] = start else xto[i]= text_w/2 + ((expand-1)*height)/2 end
		yto[i]=xx
		xx=xx + ((height+space)*(show-i))*d
		d = d*(-1)
		end
	else for i=1, show do
		if i == select then 
			xto[i]=0
			yto[i]=xx - ((expand-1)*(height+space))/2
		else
			xto[i]=((expand-1)*height)/2
			if -d*((show-i)/2)<xs then
				yto[i]= xx - (expand-1)*height/2
				else
				yto[i]= xx + (expand-1)*height/2
			end
		end
		if i <= hide then xto[i]=start end
		xx=xx + ((height+space)*(show-i))*d
		d = d*(-1)
		end
	end
end

function update_horizonal()
	local xs = 0
	if (select % 2 == 0) then xs = (show-select)/2 else xs = -(show-select)/2 end
	local xx = (skinwidth/2) - (show * (width+space) / 2) + space/2
	local d = 1
	if select == 0 then
	for i=1, show do
		if i <= hide then yto[i] = start else yto[i]=((expand-1)*width)/2 end
		xto[i]=xx
		xx=xx + ((width+space)*(show-i))*d
		d = d*(-1)
		end
	else for i=1, show do
		if i == select then 
			yto[i]=0
			xto[i]=xx - ((expand-1)*width)/2
			else
			yto[i]=((expand-1)*width)/2
			if space > 0 then 
			xto[i]=xx
			elseif -d*((show-i)/2)<xs then
				xto[i]= xx - (expand-1)*width/2
				else
				xto[i]= xx + (expand-1)*width/2
			end
		end
		if i <= hide then yto[i]=start end
		xx=xx + ((width+space)*(show-i))*d
		d = d*(-1)
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
		show = count+1
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
		if enable_hotkey then SKIN:Bang("!Refresh")
		else update() end
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
	SKIN:Bang("!WriteKeyValue", "Variables", 'Gamedir'..count+1, '', "#Applist#")
	SKIN:Bang("!WriteKeyValue", "Variables", 'Gamename'..count+1, 'New icon', "#Applist#")
	SKIN:Bang("!WriteKeyValue", "Variables", "update_list", 1, "#@#\\Global.Settings.inc")
	if edit == 1 then SKIN:Bang("!DeactivateConfig", "#ROOTCONFIG#\\Debug") end
	SKIN:Bang("!Refresh")
end

function remove_icon()
	for i=edit_entry, count-1 do
	local Gamecover=SKIN:GetVariable('Gamecover'..i+1)
	local Gamedir=SKIN:GetVariable('Gamedir'..i+1)
	local Gamename=SKIN:GetVariable('Gamename'..i+1)
	SKIN:Bang("!WriteKeyValue", "Variables", 'Gamecover'..i, Gamecover, "#Applist#")
	SKIN:Bang("!WriteKeyValue", "Variables", 'Gamedir'..i, Gamedir, "#Applist#")
	SKIN:Bang("!WriteKeyValue", "Variables", 'Gamename'..i, Gamename, "#Applist#")
	end
	SKIN:Bang("!WriteKeyValue", "Variables", 'TotalGame', count-1, "#Applist#")
	SKIN:Bang("!WriteKeyValue", "Variables", "update_list", 1, "#@#\\Global.Settings.inc")
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
	if enable_hotkey==1 then SKIN:Bang("!WriteKeyValue", "Variables", "update_list", 1, "#@#\\Global.Settings.inc") end
end

function interact(index,dismiss)
	if dismiss == nul then dismiss = 1 end
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
	elseif string.match(command, 'folder:') then 
		command = string.sub(command,8)
		SKIN:Bang(command)
		return
	elseif string.match(command, 'gamehub:') then 
		command = string.sub(command,9)
		gamehub(command)
		return
	elseif string.match(command, 'submenu:') then 
		sub_menu(command,index)
		return
	elseif string.match(command, 'function:') then 
		if dismiss == 0 then 
			command = string.sub(command,10)
			local alt = SKIN:GetVariable(command.."_alt",nil)
			if alt ~= nil then
				SKIN:Bang(alt)
				dismiss = 1
			else
				SKIN:Bang(SKIN:GetVariable(command))
			end
		else
			command = string.sub(command,10)
			SKIN:Bang(SKIN:GetVariable(command))
		end
	elseif string.match(command, '%[') then
		SKIN:Bang(command)
	else
		SKIN:Bang('"'..command..'"')
	end
	if tonumber(dismiss) == 0 then
		SKIN:Bang("!ZPos", 2)
		set_state(1)
		timer("set")
		end
	if hideicon == 1 and tonumber(dismiss) == 1 then
		highlight(0)
		subroutine_end()
		set_state(2)
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 9")
	end
end

function gamehub(cfg)
	highlight(0)
	if tonumber(dismiss) == 0 then SKIN:Bang("!ZPos", 2) end
	if hideicon == 1 then
		subroutine_end()
		set_state(2)
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 9")
	else
		SKIN:Bang("!CommandMeasure", "Animation", "Execute 13")
	end
	SKIN:Bang("!WriteKeyValue", "Variables", "filelayout", cfg, "#SKINSPATH#\\GameHub 2\\@Resources\\Settings.inc")
	SKIN:Bang("!ActivateConfig", "GameHub 2", "GameHUB.ini")
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
	SKIN:Bang("!WriteKeyValue", "Variables", "Gamename"..a, SKIN:GetVariable("Gamename"..b), SKIN:GetVariable("Applist"))

	SKIN:Bang("!WriteKeyValue", "Variables", "Gamecover"..b, SKIN:GetVariable("Gamecover"..a), SKIN:GetVariable("Applist"))
	SKIN:Bang("!WriteKeyValue", "Variables", "Gamedir"..b, SKIN:GetVariable("Gamedir"..a), SKIN:GetVariable("Applist"))
	SKIN:Bang("!WriteKeyValue", "Variables", "Gamename"..b, SKIN:GetVariable("Gamename"..a), SKIN:GetVariable("Applist"))

	SKIN:Bang('!SetVariable', 'Gamecover'..b, SKIN:GetVariable('Gamecover'..a))
	SKIN:Bang('!SetVariable', 'Gamedir'..b, SKIN:GetVariable('Gamedir'..a))
	SKIN:Bang('!SetVariable', 'Gamename'..b, SKIN:GetVariable('Gamename'..a))

	SKIN:Bang('!SetVariable', 'Gamecover'..a, temp_icon)
	SKIN:Bang('!SetVariable', 'Gamedir'..a, temp_dir)
	SKIN:Bang('!SetVariable', 'Gamename'..a, temp_name)

	SKIN:Bang("!SetOption", "MeterTitle", "Text", "Icon select", "#ROOTCONFIG#\\Debug")
	SKIN:Bang("!SetOption", "MeterContext", "Text", "Icon position swapped#CRLF#Drag and drop file or image into the icons, Press (+) to add icon", "#ROOTCONFIG#\\Debug")
	update()
	swap=0
	if enable_hotkey==1 then SKIN:Bang("!WriteKeyValue", "Variables", "update_list", 1, "#@#\\Global.Settings.inc") end
end

function sub_menu(command,index)
	local s=command:match("%[(.-)%]")
	local cfg="Dock.ini"
	if s~=nil then
		command = command:gsub('%b[]', '')
		cfg = s
	end
	SKIN:Bang('!SetVariable', 'check_config' , '#ROOTCONFIG#\\'.. string.sub(command, 9))
	SKIN:Bang('!UpdateMeasure', 'ActiveConfig')
	is_active = ConfigMeasure:GetValue()
	if is_active == 1 then return end
	SKIN:Bang("!WriteKeyValue", "Variables", "subroutine_index", index, string.sub(command, 9) .. "\\"..cfg)
	SKIN:Bang("!WriteKeyValue", "Variables", "is_subroutine", "1", string.sub(command, 9) .. "\\"..cfg)
	SKIN:Bang("!WriteKeyValue", "Variables", "Parent", "#CURRENTCONFIG#", string.sub(command, 9) .. "\\"..cfg)
	SKIN:Bang("!WriteKeyValue", "Variables", "direction", SKIN:GetVariable('direction'), string.sub(command, 9) .. "\\Settings.inc")
	SKIN:Bang("!ActivateConfig","#ROOTCONFIG#\\".. string.sub(command, 9), cfg)
	local xstart = 0
	local ystart = 0
	if last_submenu~=nil then
		if last_submenu~="#ROOTCONFIG#\\".. string.sub(command, 9) then
		SKIN:Bang("!CommandMeasure","Animate","timer('timeout')",last_submenu) end
	end
	last_submenu="#ROOTCONFIG#\\".. string.sub(command, 9)
	local d=tonumber(SKIN:GetVariable('direction'))
	if d==1 then
		xstart=SKIN:GetVariable('CURRENTCONFIGX') + xto[index] + width*expand/2
		if focus==1 then ystart=SKIN:GetVariable('CURRENTCONFIGY') + skinheight/2 + height/2
		else
		if tonumber(SKIN:GetVariable('snap',0))==0 then
			ystart=SKIN:GetVariable('CURRENTCONFIGY')
			else ystart=SKIN:GetVariable('CURRENTCONFIGY') + skinheight/2 - height/2 end
		end
	elseif d==2 then
		xstart=SKIN:GetVariable('CURRENTCONFIGX') + xto[index] + width*expand/2
		if focus==1 then ystart=SKIN:GetVariable('CURRENTCONFIGY') + skinheight/2 - height/2
		else
		if tonumber(SKIN:GetVariable('snap',0))==0 then
		ystart=SKIN:GetVariable('CURRENTCONFIGY') + skinheight/2 + height
		else ystart=SKIN:GetVariable('CURRENTCONFIGY') + skinheight/2 + height/2 end
		end
	elseif d==3 then
		if focus==1 then xstart=SKIN:GetVariable('CURRENTCONFIGX') + skinwidth/2 + width/2
		else
		if tonumber(SKIN:GetVariable('snap',0))==0 then
			xstart=SKIN:GetVariable('CURRENTCONFIGX') 
			else xstart=SKIN:GetVariable('CURRENTCONFIGX') + skinwidth/2 - width/2 end
		end
		ystart=SKIN:GetVariable('CURRENTCONFIGY') + yto[index] + height*expand/2
	else	
		if focus == 1 then xstart=SKIN:GetVariable('CURRENTCONFIGX') + skinwidth/2 - width/2
		else
		if tonumber(SKIN:GetVariable('snap',0))==0 then
			xstart=SKIN:GetVariable('CURRENTCONFIGX') + skinwidth/2 + width
			else xstart=SKIN:GetVariable('CURRENTCONFIGX') + skinwidth/2 + width/2 end
		end
		ystart=SKIN:GetVariable('CURRENTCONFIGY') + yto[index] + height*expand/2
	end
	SKIN:Bang("!Move" ,xstart ,ystart , "#ROOTCONFIG#\\".. string.sub (command, 9))
	if focus == 1 then
	SKIN:Bang("!ClickThrough", "1")
	highlight(0)
	set_state(2)
	SKIN:Bang("!CommandMeasure", "Animation", "Stop 9")
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
			SKIN:Bang("!Move", skinx-(skinwidth/2), skiny-skinheight/2-height/2)
		elseif d==2 then
			SKIN:Bang("!Move", skinx-(skinwidth/2), skiny-skinheight/2+height/2)
		elseif d==3 then
			SKIN:Bang("!Move", skinx-skinwidth/2-width/2, skiny-(skinheight/2))
		else
			SKIN:Bang("!Move", skinx-skinwidth/2+width/2, skiny-(skinheight/2))
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

function activate_hotkey()
	for i=1, hotkey_count do
		SKIN:Bang("!CommandMeasure", "Hotkey"..i, "Start")
	end
	if hideicon == 0 then SKIN:Bang("!CommandMeasure", "Animation", "Execute 16") end
end

function deactivate_hotkey()
	for i=1, hotkey_count do
		SKIN:Bang("!CommandMeasure", "Hotkey"..i, "Stop")
	end
end

function hotkey(index)
	if focus == 0 then return end
	if tonumber(SKIN:GetVariable('Lock'))==1 then return end
	index = tonumber(index)
	if index == 0 then
		if hideicon == 1 then
			if state ~= 2 then return end
			SKIN:Bang("!ZPos", 2)
			set_state(1)
			timer('set')
			SKIN:Bang("!CommandMeasure", "Animation", "Execute 15")
		else
			activate_hotkey()
			SKIN:Bang("!CommandMeasure", "Animation", "Stop 2")
			SKIN:Bang("!CommandMeasure", "Animation", "Execute 16")
			SKIN:Bang("!ZPos", 2)
		end
	else
		highlight(index)
		interact(index, 0)
	end
end
