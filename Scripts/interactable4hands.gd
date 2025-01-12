extends Interactable

@onready var hands_to_collect: Node2D = $".."
@onready var hand_job: Node2D = $"../.."
																																						   
# Called when the node enters the scene tree for the first time.
func _on_interact(interaction_name:String, _player):
	PlayerProgress.arms_enabled = true
	PlayerProgress.piano_hands_gone = true
	hand_job.visible = false
