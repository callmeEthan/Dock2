
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