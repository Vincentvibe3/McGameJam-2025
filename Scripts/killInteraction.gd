extends Interactable


func _on_interact(_interaction_name:String, _player):
	get_tree().reload_current_scene()