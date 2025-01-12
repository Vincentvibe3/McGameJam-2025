extends Area2D

class_name BackToCorridor

@export var node_name: String
@export var scene_name: String

func _on_body_entered(body:Node2D) -> void:
	if body is Player:
		PlayerProgress.call_deferred("move_to",node_name ,scene_name)
