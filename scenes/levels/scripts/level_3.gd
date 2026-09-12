extends Node2D

@export var grav_mod_1: Node2D
@export var grav_mod_4: Node2D


func _ready() -> void:
	grav_mod_1.alt_grav.connect(_move)

func _move():
	grav_mod_4.position = Vector2(119, 68)
