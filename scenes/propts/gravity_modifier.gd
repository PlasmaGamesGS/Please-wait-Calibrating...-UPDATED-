extends Node2D

@export var area_2d: Area2D

func _ready() -> void:
	area_2d.body_entered.connect(_mod_gravity)
	
func _mod_gravity(body):
	if body.is_in_group("characters"):
		body._mod_gravity()
		queue_free()
