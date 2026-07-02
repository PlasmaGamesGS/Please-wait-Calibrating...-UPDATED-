extends Button

@export var title_scene: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_back)


func _back():
	pass
