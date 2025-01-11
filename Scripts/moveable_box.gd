extends RigidBody2D

@onready var main_character: CharacterBody2D = $main_character


func _on_pushing_area_area_entered(area: Area2D) -> void:
	print("tryna push")
	if main_character.position.x < position.x:
		position.x += 1
	else:
		position.x -= 1
