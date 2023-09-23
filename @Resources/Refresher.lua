-- @author Malody Hoe / GitHub: madhoe / Twitter: maddhoexD
-- Add this after all incs!
function Initialize()
	update_list = tonumber(SKIN:GetVariable("update_list",2))
	subroutine = tonumber(SKIN:GetVariable("is_subroutine",2))
	if update_list == 0 and subroutine == 0 then return end
	first_action = SKIN:GetVariable("WhenRefreshAction","")
	second_action = SKIN:GetVariable("WhenRefreshedAction","")
	if SELF:GetOption("Refreshed", "0") == "0" then
		if first_action ~= "" then SKIN:Bang(first_action) end
		SKIN:Bang("!WriteKeyValue", SELF:GetName(), "Refreshed", "1")
		SKIN:Bang("!Refresh")
	else
		if SKIN:GetVariable('SoundStart')~=nil then SKIN:Bang('Play #@#Sounds\\'..SKIN:GetVariable('SoundStart')) end
		if second_action ~= "" then SKIN:Bang(second_action) end
		SKIN:Bang("!WriteKeyValue", SELF:GetName(), "Refreshed", "0")
	end
end