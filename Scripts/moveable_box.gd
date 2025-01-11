extends RigidBody2D
@onready var main_character: CharacterBody2D = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#enabling pushing
	if main_character.position < position and main_character
