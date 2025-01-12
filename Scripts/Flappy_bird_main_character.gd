extends Player


const BASE_SPEED = 300.0
const LEG_SPEED = 400

@onready var legs: Node2D = $Legs
@onready var torso: Node2D = $Torso
@onready var face: Node2D = $Face
@onready var torso_collision: CollisionShape2D = $TorsoCollision
@onready var legs_collision: CollisionShape2D = $LegsCollision
@onready var ears: Node2D = $ears
@onready var arms: Node2D = $arms

func _physics_process(delta: float) -> void:
	var SPEED = 1
	if not PlayerProgress.ears_enabled:
		ears.visible = false
	if not PlayerProgress.arms_enabled:
		arms.visible = false
	if not PlayerProgress.Leg_enabled:
		SPEED = BASE_SPEED
		legs.visible = false
		legs_collision.disabled = true
	if not PlayerProgress.Face_enabled:
		face.visible = false
	if not PlayerProgress.Torso_enabled:
		torso.visible = false
		torso_collision.disabled = true
	if PlayerProgress.ears_enabled:
		ears.visible = true
	if PlayerProgress.arms_enabled:
		arms.visible = true
	if PlayerProgress.Leg_enabled:
		SPEED = LEG_SPEED
		legs.visible = true
		legs_collision.disabled = false
	if PlayerProgress.Face_enabled:
		face.visible = true
	if PlayerProgress.Torso_enabled:
		torso.visible = true
		torso_collision.disabled = false
	# # Handle jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	# 	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var movementSet = false
	velocity.x = SPEED
	if Input.is_action_pressed("move_up"):
		velocity.y = -SPEED
		movementSet = true
	elif Input.is_action_just_released("move_up"):
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_pressed("move_down"):
		velocity.y = SPEED
		movementSet = true
	elif Input.is_action_just_released("move_down"):
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if !movementSet:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
