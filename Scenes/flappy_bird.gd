extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var timer: Timer = $Timer
@onready var left_arms_anim: AnimationPlayer = $LeftArms/LeftArmsAnim
@onready var right_arms_anim: AnimationPlayer = $RightArms/RightArmsAnim
@onready var right_legs_anim: AnimationPlayer = $RightLegs/RightLegsAnim
@onready var left_legs_anim: AnimationPlayer = $LeftLegs/LeftLegsAnim

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_timer_timeout() -> void:
	var int_to_move = randi_range(0,4)
	if int_to_move == 1:
		left_arms_anim.play("LEFT_ARM")
	elif int_to_move == 2:
		right_arms_anim.play("RIGHT_ARM")
	elif int_to_move == 3:
		right_legs_anim.play("RIGHT LEGS")
	elif int_to_move == 4:
		left_legs_anim.play("LEFT LEGS")
