extends Player

const BASE_SPEED = 300.0
const LEG_SPEED = 400
const JUMP_VELOCITY = -500.0
const sprint_multiplier = 1
const box_pushing = 60
@onready var animated_sprite_2d: AnimatedSprite2D = $animations/AnimatedSprite2D
@onready var SPEED
@onready var animations: Node2D = $animations

@onready var legs: Node2D = $Legs
@onready var torso: Node2D = $Torso
@onready var face: Node2D = $Face
@onready var torso_collision: CollisionShape2D = $TorsoCollision
@onready var legs_collision: CollisionShape2D = $LegsCollision
@onready var ears: Node2D = $ears
@onready var arms: Node2D = $arms

func _ready() -> void:
	animations.visible = false
	if not PlayerProgress.ears_enabled:
		ears.visible = false
	if PlayerProgress.Face_enabled:
		face.visible = true
	if PlayerProgress.ears_enabled:
		ears.visible = true
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

	if PlayerProgress.arms_enabled:
		arms.visible = true
	if PlayerProgress.Leg_enabled:
		SPEED = LEG_SPEED
		legs.visible = true
		legs_collision.disabled = false

	if PlayerProgress.Torso_enabled:
		torso.visible = true
		torso_collision.disabled = false

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("move_left"):
		for child in get_children():
			for subchild in child.get_children():
				if subchild is AnimatedSprite2D or Sprite2D:
					subchild.flip_h = true
	if Input.is_action_just_pressed("move_right"):
		for child in get_children():
			for subchild in child.get_children():
				if subchild is AnimatedSprite2D or Sprite2D:
					subchild.flip_h = false
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and PlayerProgress.Leg_enabled:
		velocity.y = JUMP_VELOCITY
		
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := 0

	direction = Input.get_axis("move_left", "move_right")
	#FORANIMS
	torso.visible=false
	arms.visible = false
	legs.visible = false
	if PlayerProgress.arms_enabled and not PlayerProgress.Leg_enabled and not PlayerProgress.Torso_enabled:
		animations.visible = true
		animated_sprite_2d.play("justarms")
	elif PlayerProgress.arms_enabled and PlayerProgress.Leg_enabled and not PlayerProgress.Torso_enabled:
		animations.visible = true
		animated_sprite_2d.play("withNoTorso")
	elif PlayerProgress.arms_enabled and not PlayerProgress.Leg_enabled and PlayerProgress.Torso_enabled:
		animations.visible = true
		animated_sprite_2d.play("arms+torso")
	elif not PlayerProgress.arms_enabled and PlayerProgress.Leg_enabled and not PlayerProgress.Torso_enabled:
		animations.visible = true
		animated_sprite_2d.play("justlegs")
	elif PlayerProgress.arms_enabled and PlayerProgress.Leg_enabled and PlayerProgress.Torso_enabled:
		animations.visible = true
		animated_sprite_2d.play("withTorso")
	elif not PlayerProgress.arms_enabled and PlayerProgress.Leg_enabled and PlayerProgress.Torso_enabled:
		animations.visible = true
		animated_sprite_2d.play("legstorso")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x == 0:
		animations.visible = false
		if PlayerProgress.arms_enabled:
				arms.visible = true
		if PlayerProgress.Leg_enabled:
			legs.visible = true
		if PlayerProgress.Torso_enabled:
			torso.visible=true

	

	move_and_slide()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal()*box_pushing)
