extends Node2D

var selected = 0
# Called when the node enters the scene tree for the first time.
@onready var selected_sprite: Sprite2D = $SelectedSprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not selected:
		selected_sprite.visible = false
	else:
		selected_sprite.visible = true
