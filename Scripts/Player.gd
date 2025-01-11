extends CharacterBody2D

class_name Player

signal interact(interact)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		interact.emit()