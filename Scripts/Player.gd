extends CharacterBody2D

class_name Player

signal interact(interaction_name:String)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		interact.emit("interact")
	elif Input.is_action_just_pressed("interact_secondary"):
		interact.emit("interact_secondary")
	
