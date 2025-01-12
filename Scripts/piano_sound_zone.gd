extends "res://Scripts/sound_zone_4_loops.gd"

@onready var audio_4_zone: AudioStreamPlayer2D = $Audio4Zone

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if PlayerProgress.piano_hands_gone:
		audio_4_zone.stop()
