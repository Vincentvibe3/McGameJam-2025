
extends CharacterBody2D

class_name TopDownPlayerController

const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	# if not is_on_floor():
	# 	velocity += get_gravity() * delta

	# # Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	# 	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var movementSet = false
	if Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		movementSet = true
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		movementSet = true
	if Input.is_action_pressed("move_up"):
		velocity.y = -SPEED
		movementSet = true
	if Input.is_action_pressed("move_down"):
		velocity.y = SPEED
		movementSet = true
	if !movementSet:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
