extends Button

@export var main_menu: PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_replay)


func _replay():
	get_tree().change_scene_to_packed(main_menu)
