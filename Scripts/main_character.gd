extends Player


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const sprint_multiplier = 2

var Leg_enabled = 0
var Face_enabled = 0
var Torso_enabled = 0
var top_down = 0 #use to make alternate controls for topdown
var flappy_bird = 0 #use to make alternate controls for flappy_bird
@onready var legs: Node2D = $Legs
@onready var torso: Node2D = $Torso
@onready var face: Node2D = $Face
var need_to_float = 0

func _physics_process(delta: float) -> void:
	if Leg_enabled:
		legs.visible = true
	if Face_enabled:
		face.visible = true
	if Torso_enabled:
		torso.visible = true
	
	
	# Add the gravity.
	if not is_on_floor() and not need_to_float:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and Leg_enabled:
		velocity.y = JUMP_VELOCITY
		
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := 0
	if Input.is_action_pressed("sprint") and Leg_enabled:
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
