extends Node2D

@export var area_2d: Area2D

func _ready() -> void:
	area_2d.body_entered.connect(_alter_size)
	
func _alter_size(body):
	if body.is_in_group("characters"):
		body._mod_size()
		queue_free()
