extends AnimatedSprite2D

signal decrease

@export var area: Area2D

func _ready() -> void:
	if area.mouse_entered:
		frame = 1
	if area.mouse_exited:
		frame = 0
		if Input.is_action_just_pressed("LMB"):
			decrease.emit()
