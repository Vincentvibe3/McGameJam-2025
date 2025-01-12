extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#PlayerProgress.arms_enabled = false
	PlayerProgress.ears_enabled = false
	PlayerProgress.Face_enabled = false
	PlayerProgress.Leg_enabled = false
	PlayerProgress.Torso_enabled = false
	
	if PlayerProgress.arms_enabled and !PlayerProgress.ears_enabled and !PlayerProgress.Face_enabled and !PlayerProgress.Torso_enabled and !PlayerProgress.Leg_enabled:	
		$Control/armsonly.play()
	elif PlayerProgress.arms_enabled and !PlayerProgress.ears_enabled and !PlayerProgress.Face_enabled and !PlayerProgress.Torso_enabled and PlayerProgress.Leg_enabled:	
		$Control/armleg.play()
	elif !PlayerProgress.arms_enabled and !PlayerProgress.ears_enabled and !PlayerProgress.Face_enabled and !PlayerProgress.Torso_enabled and PlayerProgress.Leg_enabled:	
		$Control/leg.play()
		PlayerProgress.kill()
	elif !PlayerProgress.arms_enabled and !PlayerProgress.ears_enabled and !PlayerProgress.Face_enabled and PlayerProgress.Torso_enabled and !PlayerProgress.Leg_enabled:	
		$Control/torso.play()
		#PlayerProgress.kill()
	elif PlayerProgress.arms_enabled and !PlayerProgress.ears_enabled and !PlayerProgress.Face_enabled and PlayerProgress.Torso_enabled and !PlayerProgress.Leg_enabled:	
		$Control/torsoarm.play()
		#PlayerProgress.kill()
	elif !PlayerProgress.arms_enabled and !PlayerProgress.ears_enabled and !PlayerProgress.Face_enabled and PlayerProgress.Torso_enabled and !PlayerProgress.Leg_enabled:	
		$Control/torsoleg.play()
		#PlayerProgress.kill()
	else:
		$Control/realend.play()

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	PlayerProgress.kill()
