extends Node2D

@onready var player: Player = $PlayerCharacter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(PlayerProgress.spawn)
	if PlayerProgress.spawn == null:
		print("loading")
		print(PlayerProgress.lastPosition)
		player.position = PlayerProgress.lastPosition
	else:
		var spawn = get_node("Spawns/"+PlayerProgress.spawn).position
		player.position = spawn
