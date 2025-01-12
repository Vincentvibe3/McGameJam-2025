extends Area2D


# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
@onready var death_anim: AnimationPlayer = $DeathAnim
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	death_anim.play("Death Animation")
	timer.start()


func _on_timer_timeout() -> void:
	PlayerProgress.move_to("deathSpawn", "res://Scenes/corridor.tscn")
