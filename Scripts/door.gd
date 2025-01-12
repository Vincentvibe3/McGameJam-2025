extends Interactable

@export var node_name: String

func _on_interact(interaction_name:String):
	if interaction_name == "interact":
		PlayerProgress.call_deferred("move_to",node_name ,"res://Scenes/MainTopDown.tscn")
	elif interaction_name == "interact_secondary":
		pass
