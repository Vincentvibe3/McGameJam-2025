extends RigidBody2D

@onready var main_character: CharacterBody2D = $"../MainCharacter"

var need_to_push = false

func _process(delta: float) -> void:
	
	if need_to_push and main_character:
		if main_character.position.x < position.x:
			position.x = position.x + 1
		else:
			position.x -=1
func _on_body_entered(body) -> void:
	need_to_push = true
	


func _on_body_exited(body: Node2D) -> void:
	need_to_push = false
