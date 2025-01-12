extends Node

var Leg_enabled = 0
var Face_enabled = 0
var Torso_enabled = 0
var ears_enabled = 0
var arms_enabled = 0
var piano_broken = 0
var piano_hands_gone = 0
var first_kill_done = 0

var spawn = "Default"
var lastPosition:Vector2 = Vector2(0,0)

var global_music:AudioStreamPlayer
var mainMusicEars = load("res://Audio/MainAmbience.mp3")
var mainMusicNoEars = load("res://Audio/MainAmbience.mp3")
var mazeMusic = load("res://Audio/MazeAmbience.mp3")

func _ready():
	print("child added")
	var audio = AudioStreamPlayer.new()
	global_music = audio
	audio.autoplay = true
	audio.stream = mainMusicEars
	add_child(audio)

func pause_music():
	global_music.stop()

func kill():
	spawn = "Default"
	get_tree().change_scene_to_file("res://Scenes/corridor.tscn")

func move_to(spawn_name, lastPos ,scene, is_return):
	if spawn_name == null and !is_return:
		print(lastPos)
		lastPosition = lastPos  
	spawn = spawn_name
	get_tree().change_scene_to_file(scene)
