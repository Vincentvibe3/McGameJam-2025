extends Node

var Leg_enabled = 1
var Face_enabled = 0
var Torso_enabled = 0
var ears_enabled = 0
var arms_enabled = 0
var piano_broken = 0
var piano_hands_gone = 0
var first_kill_done = 0

var spawn = "Default"
var lastPosition:Vector2 = Vector2(0,0)

func kill():
	spawn = "Default"
	get_tree().change_scene_to_file("res://Scenes/corridor.tscn")

func move_to(spawn_name, scene):
	spawn = spawn_name
	get_tree().change_scene_to_file(scene)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
