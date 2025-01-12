extends Node2D
@onready var computer_scene_blink: Sprite2D = $ComputerSceneBlink
@onready var timer: Timer = $Timer

@onready var ears_acquired: Sprite2D = $EarsAcquired


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(2.0).timeout # Wait for the timer's timeout signal
	computer_scene_blink.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("blink"):
		$Timer.start()
		ears_acquired.visible = true
		PlayerProgress.ears_enabled = 1
	if Input.is_action_just_pressed("escape"):
		PlayerProgress.move_to(null, null, "res://Scenes/BedroomB.tscn", true)
	


func _on_timer_timeout() -> void:
	PlayerProgress.move_to(null, null, "res://Scenes/BedroomB.tscn", true)
	pass # Replace with function body.
