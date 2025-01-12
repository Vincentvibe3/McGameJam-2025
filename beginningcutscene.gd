extends Control


# Called when the node enters the scene tree for the first time.

func _on_video_stream_player_finished() -> void:
	PlayerProgress.move_to("Default",null, "res://Scenes/corridor.tscn", false)
