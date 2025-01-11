extends Area2D

@onready var audio: AudioStreamPlayer2D = $Audio4Zone


func _on_body_entered(body: Node2D) -> void:
	audio.play()


func _on_body_exited(body: Node2D) -> void:
	audio.stop()
