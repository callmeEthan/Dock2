[MeterShadow]
Meter=Image
ImageName=#@#shadow.png
X=(#bx#+2-clamp(#bw#/2,40,20))
Y=(#by#+2-20)
W=(Clamp(#bw#*1.2-10,80,#bw#+40))
H=(#bh#+40)
ImageAlpha=(min(#bw#,80))
ScaleMargins=40,40,40,40
DynamicVariables=1
Group=Background

[HeaderOutline]
Meter=Shape
Shape=Rectangle #bx#, (#by#-[HeaderTitle:H]-5), (min([HeaderTitle:W]+30,#bw#)), (min([HeaderTitle:H]+50,#bh#)),(#size#/3) | Fill Color 0,0,0,0 | StrokeWidth 2 | Stroke LinearGradient Gradient
Gradient= 120 | 80, 143, 190, 255 ; 1 | 150,150,150,20 ; 0,9
DynamicVariables=1  
Group=Header
Hidden=1

[MeterBackground]
Meter=Shape
Shape=Rectangle #bx#, #by#, #bw#, #bh#,(#size#/2)| Fill Color #background# | StrokeWidth 2 | Stroke LinearGradient Gradient
Gradient= 120 | 70, 142, 209, 255 ; 1 | 150,150,150,20 ; 0,9
DynamicVariables=1  
Group=Background
Hidden=1

[HeaderBackground]
Meter=Shape
Shape=Rectangle (#bx#+1), (#by#-[HeaderTitle:H]-5), (min([HeaderTitle:W]+30-2,#bw#)), (min([HeaderTitle:H]+50,#bh#)),(#size#/3)| Fill Color #background# | Stroke Color 0,0,0,0
DynamicVariables=1 
Group=Header
Hidden=1

[HeaderTitle]
X=(#bx#+15)
Y=(#by#-25)
Meter=String
StringAlign=TopLeft
FontFace=AGENCYB
FontColor=#FontColor#
FontSize=(#FontSize#*0.9)
Text=#Title#
DynamicVariables=1
FontWeight=500
Group=Header
AntiAlias=1
Hidden=1
