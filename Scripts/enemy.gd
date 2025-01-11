
extends CharacterBody2D

class_name EnemyController

@onready var collisionBox:CollisionShape2D = $EnemyCollision

const SPEED = 150
const SPEED_SPAWNED = 600

var spawned = false


func _physics_process(delta: float) -> void:

	# # Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	# 	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if spawned:
		velocity.x = SPEED_SPAWNED
	else:
		velocity.x = SPEED

	if move_and_slide():
		print("killing")
		get_tree().reload_current_scene()
