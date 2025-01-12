extends Node2D

@onready var interactable: Interactable = $Interactable

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactable.visible = false
	interactable.monitoring = false
