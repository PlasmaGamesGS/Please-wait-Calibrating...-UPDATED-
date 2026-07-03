extends Node2D

@export var area_2d: Area2D

func _ready() -> void:
	area_2d.body_entered.connect(_enter_stair)
	area_2d.body_exited.connect(_exit_stair)
	
func _enter_stair(body):
	if body.is_in_group("characters"):
		body.stair = true

func _exit_stair(body):
	if body.is_in_group("characters"):
		body.stair = false
