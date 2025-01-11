extends Node2D

var selected = 0
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if left or right pressed, alternate between 1,2,3, highlights respective string (toggles animation with keyframes), then when press enter it selects string
if selected = 1:
	String1.selected=1
	String2.selected=0
	String3.selected=0
else if selected = 2:
	String1.selected=0
	String2.selected=1
	String3.selected=0
else if selected = 3:
	String1.selected=0
	String2.selected=0
	String3.selected=1
