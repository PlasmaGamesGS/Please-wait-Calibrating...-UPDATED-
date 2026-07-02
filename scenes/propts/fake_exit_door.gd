extends Node2D

@export var area_2d: Area2D
@export var exit_door: Node2D

func _ready() -> void:
	area_2d.body_entered.connect(_fake_exit)

#IFK DUDE!!1!!!!
func _fake_exit(_body: Node2D) -> void:
	visible = false
	exit_door.visible = true
