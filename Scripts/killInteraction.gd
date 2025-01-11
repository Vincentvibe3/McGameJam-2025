extends Interactable


func _on_interact(_interaction_name:String):
	get_tree().reload_current_scene()