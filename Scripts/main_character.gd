extends Player


const SPEED = 300.0
const JUMP_VELOCITY = -500.0
const sprint_multiplier = 2
const box_pushing = 60

var top_down = 0 #use to make alternate controls for topdown
var flappy_bird = 0 #use to make alternate controls for flappy_bird
@onready var legs: Node2D = $Legs
@onready var torso: Node2D = $Torso
@onready var face: Node2D = $Face
var need_to_float = 0
@onready var torso_collision: CollisionShape2D = $TorsoCollision
@onready var legs_collision: CollisionShape2D = $LegsCollision
@onready var ears: Node2D = $ears
@onready var arms: Node2D = $arms

func _physics_process(delta: float) -> void:
	if not PlayerProgress.ears_enabled:
		ears.visible = false
	if not PlayerProgress.arms_enabled:
		arms.visible = false
	if not PlayerProgress.Leg_enabled:
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
		legs.visible = true
		legs_collision.disabled = false
	if PlayerProgress.Face_enabled:
		face.visible = true
	if PlayerProgress.Torso_enabled:
		torso.visible = true
		torso_collision.disabled = false
	
	
	# Add the gravity.
	if not is_on_floor() and not need_to_float:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and PlayerProgress.Leg_enabled:
		velocity.y = JUMP_VELOCITY
		
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := 0
	if Input.is_action_pressed("sprint") and PlayerProgress.Leg_enabled:
		direction = Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED * sprint_multiplier
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED*sprint_multiplier)
	else:
		direction = Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal()*box_pushing)
