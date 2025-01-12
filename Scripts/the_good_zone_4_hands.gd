extends Area2D


# Called when the node enters the scene tree for the first time.
@onready var piano_sound_zone: Area2D = $"../PianoSoundZone"
@onready var animation_player: AnimationPlayer = $"../HandJob/AnimationPlayer"
@onready var piano_bad_zone: Area2D = $"../PianoBadZone"



func _on_body_entered(body: Node2D) -> void:
	sound_zone.get_node("Audio4Zone").stop()
	animation_player.play("ready2obtain")
	piano_bad_zone.visible = false
