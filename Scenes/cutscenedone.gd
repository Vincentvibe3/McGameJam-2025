extends Control

class_name CutsceneListener

@export var scene:String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VideoStreamPlayer.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_video_stream_player_finished() -> void:
	PlayerProgress.call_deferred("move_to",null,null, scene, true)
	
