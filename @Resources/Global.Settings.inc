[Variables]

size=70
;icon size

background_image=#@#bg.png
background_margin=30
; Background image value when using background_image.inc style
; This is default value, add to Settings.inc will apply to specific dock

background=15,15,15
;Background color, delete this line remove background

;background_width=60

update_rate=10
;Redraw delay (framerate delay)

padding=20
;increase to make icon smaller

focus=1
;Whether to hide icons when a submenu is open
snap=1
;Whether to snap sub-menu position to dock (when focus is false)

move_file=1
;Whether to move file instead of copy when drag and drop file in

direction=1
;direction of the skin, 1:up  2:down  3:left  4:right

FontColor=255,255,255
FontSize=15
TextY=10
TextW=0
TextBackground=0,0,0
;Color and size icon name

update_list=0
; Update meters for icon (this is automatically done when performing command for "add/remove" icon)
; Set this to 2 will force it to update everytime the skin is open.

enable_hotkey=1
; Hotkey for interacting with main dock and icons, requires focus = 1
; By default, Pressing the initial letter of the icon name will activate it, when its dock/subdock is present
; You can set custom hotkey for icon, just add Hotkey# value into the list file (ex: Hotkey3 = S)
; When making change to hotkey setting, hotkey value or icon name, make sure to update the skin meter (by right click editted dock and choose "Update meter & hotkey")
