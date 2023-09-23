[MeterBackground]
Meter=Image
ImageName=#background_image#
X=(#bx#)
Y=(#by#)
W=(#bw#)
H=(#bh#)
ScaleMargins=(min(#bw#,#background_margin#)),(min(#bh#,#background_margin#)),(min(#bw#,#background_margin#)),(min(#bh#,#background_margin#))
DynamicVariables=1
Group=Background

[HeaderBackground]
Meter=Shape
Shape=Rectangle #bx#, (#by#-[Header:H]-5), (min([Header:W]+20,#bw#)), (min([Header:H]+20,#bh#)),(#size#/7)| Fill Color #background# | Stroke Color 0,0,0,0
DynamicVariables=1  
Group=Headers
Hidden=1

[Header]
X=(#bx#+10)
Y=(#by#-25)
Meter=String
StringAlign=TopLeft
FontFace=AGENCYB
FontColor=#FontColor#
FontSize=(#FontSize#*0.9)
Text=#Title#
DynamicVariables=1
FontWeight=500
Group=Headers
AntiAlias=1
Hidden=1