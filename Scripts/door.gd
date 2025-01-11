extends Interactable

@export var room : PackedScene

func _on_interact(interaction_name:String):
	if interaction_name == "interact":
		get_tree().change_scene_to_packed(room)
	elif interaction_name == "interact_secondary":
		pass
