extends Node2D

@export var death_anim = AnimationPlayer
# Called when the node enters the scene tree for the first time.
@onready var limb_area: Area2D = $LimbArea

func _ready() -> void:
	limb_area.death_anim=get_parent().get_parent().get_node("DeathAnim")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
