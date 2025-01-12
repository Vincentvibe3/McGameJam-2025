extends Area2D

# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elaps@expted time since the previous frame.
@onready var timer: Timer = $Timer
var death_anim : AnimationPlayer
func _on_body_entered(body: Node2D) -> void:
	if death_anim:
		death_anim.play("Death Animation")
		timer.start()

func _on_timer_timeout() -> void:
	PlayerProgress.move_to("Door2",null, "res://Scenes/corridor.tscn", false)
