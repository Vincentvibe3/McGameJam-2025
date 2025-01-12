extends Interactable

class_name InteractGoTo

@export var node_name: String
@export var scene_name: String
@export var minigame = false
@export var minigameExit = false

func _on_interact(_interaction, player) -> void:
	
	if !minigame:
		PlayerProgress.call_deferred("move_to",node_name,player.position, scene_name, minigameExit)
	else:
		print("minigame start")
		PlayerProgress.call_deferred("move_to",null,player.position, scene_name, minigameExit)
