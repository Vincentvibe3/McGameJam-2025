extends Interactable

@export var node_name: String
@export var scene_name: String

func _on_interact(interaction_name:String, player):
	if interaction_name == "interact":
		PlayerProgress.call_deferred("move_to",node_name, player.position ,scene_name, false)
	elif interaction_name == "interact_secondary":
		pass        
