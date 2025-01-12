extends Interactable


func _on_interact(_i, _p):
	get_tree().change_scene_to_file("res://Scenes/EndScene.tscn")