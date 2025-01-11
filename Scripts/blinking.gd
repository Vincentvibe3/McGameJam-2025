extends Node2D

var blinkCounter = 0
# Called when the node enters the scene tree for the first time.
@onready var eye_lids: Sprite2D = $EyeLids
@onready var timer_for_counter: Timer = $TimerForCounter
@onready var timer_to_blink: Timer = $TimeToBlink


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("blink"):
		blinkCounter +=1	
		eye_lids.visible = true
		timer_to_blink.start()
		print(blinkCounter)


func _on_timer_for_counter_timeout() -> void:
	blinkCounter -=1
	if blinkCounter > 0:
		timer_for_counter.start()
	print(blinkCounter)


func _on_time_to_blink_timeout() -> void:
	eye_lids.visible = false
	timer_for_counter.start()
