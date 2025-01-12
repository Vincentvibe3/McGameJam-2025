extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sound_zone: Area2D = $"../PianoSoundZone"
@onready var piano_bad_zone: Area2D = $"../PianoBadZone"

func _ready() -> void:
	if not PlayerProgress.piano_hands_gone:
		animation_player.play("playing piano")

func _on_piano_bad_zone_body_entered(body: Node2D) -> void:
	if not PlayerProgress.piano_hands_gone:
		sound_zone.get_node("Audio4Zone").stop()
		animation_player.play("handsurprised")
		animation_player.queue("handrunning")
		piano_bad_zone.monitoring = false
