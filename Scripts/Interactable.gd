extends Area2D

class_name Interactable

@onready var label:Label = $Control/Label

func _on_interact():
	pass

func _on_body_entered(body:Node2D) -> void:
	print("entered")
	if body is Player:
		body.interact.connect(_on_interact)
		label.visible = true

func _on_body_exited(body:Node2D) -> void:
	print("exited")
	if body is Player:
		body.interact.disconnect(_on_interact)
		label.visible = false
