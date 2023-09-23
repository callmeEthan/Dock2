-- RepeatSection v1.1
-- LICENSE: Creative Commons Attribution-Non-Commercial-Share Alike 3.0

function Initialize()
	enable_hotkey = tonumber(SKIN:GetVariable('enable_hotkey',0))
	update_list = tonumber(SKIN:GetVariable("update_list",2))
	if update_list > 0 then
		update_meter()
	if update_list == 1 then SKIN:Bang("!WriteKeyValue", "Variables", "update_list", 0, "#@#\\Global.Settings.inc") end
	end
end

function log(x)
	SKIN:Bang("!Log", x)
end

function update_meter()
	log("Updating list meters file")
	local w,j,ini,gsub={},1,io.input(SKIN:ReplaceVariables(SELF:GetOption("ReadFile"))):read("*all"),string.gsub
	local Sub,Index,Limit=SELF:GetOption("Sub"),SKIN:ParseFormula(SELF:GetNumberOption("Index")),SKIN:ParseFormula(SELF:GetNumberOption("Limit"))
	for i=Index,Limit do
		w[j]=gsub(ini,Sub,i)
		j=j+1
	end
	
	
	local f=io.open(SKIN:ReplaceVariables(SELF:GetOption("WriteFile")),"w")
	f:write(table.concat(w,"\n\n"))
	if enable_hotkey==1 then
		f:write("\n\n")
		local h = hotkey_init()
		f:write(table.concat(h,"\n\n"))
	end
	f:close()
end

function isnil(s)
  return s == nil or s == ''
end

function hotkey_init()
	local count = tonumber(SKIN:GetVariable('TotalGame'))
	local h,j,ini,gsub={},1,io.input(SKIN:ReplaceVariables(SELF:GetOption("HotkeyFile"))):read("*all"),string.gsub
	local Sub,Index,Limit=SELF:GetOption("Sub"),SKIN:ParseFormula(SELF:GetNumberOption("Index")),SKIN:ParseFormula(SELF:GetNumberOption("Limit"))
	log("initiating hotkeys")
	local hotkeys = {}
	for i=1, count do
		local key=SKIN:GetVariable('Hotkey'..i)
		if isnil(key) then
			local name = SKIN:GetVariable('Gamename'..i)
			local letter = string.sub(name, 1, 1)
			if isnil(hotkeys[letter]) then 
				hotkeys[letter] = i
			end
		else
			hotkeys[key] = i
		end
	end
	for k,v in pairs(hotkeys) do
		h[j]=gsub(ini,"Index",j)
		h[j]=gsub(h[j],"Keycode",k)
		h[j]=gsub(h[j],"Activate",v)
		j = j+1
	end
	h[j] = "[Variables]\nHotkeyCount="..j-1
	log("Hotkey initialized, "..(j-1).." key found")
	return h
end