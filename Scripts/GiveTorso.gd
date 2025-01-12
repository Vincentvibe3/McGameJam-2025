extends Interactable

func _on_interact(_interaction, player) -> void:
	PlayerProgress.Torso_enabled = 1
	PlayerProgress.call_deferred("move_to",null,player.position, "res://Scenes/MannequinExplode.tscn", true)
