extends Interactable

@export var node_name: String
@export var scene_name: String

func _on_interact(interaction_name:String, _player):
	if interaction_name == "interact":
		PlayerProgress.call_deferred("move_to",node_name ,scene_name)
	elif interaction_name == "interact_secondary":
		pass
