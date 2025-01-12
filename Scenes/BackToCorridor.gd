extends Area2D

class_name BackToCorridor

@export var node_name: String
@export var scene_name: String
@export var minigame = false
@export var minigameExit = false

func _on_body_entered(body:Node2D) -> void:
	if body is Player:
		if !minigame:
			PlayerProgress.call_deferred("move_to",node_name,body.position, scene_name, minigameExit)
		else:
			PlayerProgress.call_deferred("move_to",null,body.position, scene_name, minigameExit)
