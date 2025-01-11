extends Interactable

@export var room : PackedScene

func _on_interact():
	get_tree().change_scene_to_packed(room)
