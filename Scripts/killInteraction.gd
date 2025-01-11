extends Interactable


func _on_interact():
	get_tree().reload_current_scene()