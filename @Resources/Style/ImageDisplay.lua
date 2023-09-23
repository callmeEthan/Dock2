function Initialize()
	active='Display1.ini'
	Background=''
	LastBackground=''
end

function swap(bkg)
	Background=bkg
	if string.find(Background, "#") then Background = nil end
	SKIN:Bang('!CommandMeasure','Animation', 'Stop 15')
	SKIN:Bang('!CommandMeasure','Animation', 'Stop 14')
	SKIN:Bang('!CommandMeasure','Animation', 'Execute 14')
end

function activate_config()
	if LastBackground == Background then return end
	if Background == nil then return end
	if active=='Display1.ini' then active='Display2.ini' else active='Display1.ini' end
	SKIN:Bang('!WriteKeyValue', 'Variables', 'Background', "#@#Background\\" .. Background , 'ImageDisplay\\config.inc')
	SKIN:Bang('[!ActivateConfig "#ROOTCONFIG#\\ImageDisplay" '.. active..']')
	LastBackground = Background
end

function deactivate_config()
	LastBackground = ''
	SKIN:Bang('[!DeactivateConfig "#ROOTCONFIG#\\ImageDisplay"]')
end