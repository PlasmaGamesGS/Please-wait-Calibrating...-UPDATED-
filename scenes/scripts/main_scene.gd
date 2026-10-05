extends Node2D

@export var levels: Array[PackedScene]
@export var _intro: AudioStreamPlayer2D
@export var _loop: AudioStreamPlayer2D
@export var _under_construction: AudioStreamPlayer2D

var current_level: int = 0
var _instantiated_level: Node
var _secret_level: bool


func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	_create_level(current_level)


func _create_level(level_number: int):
	_instantiated_level = levels[level_number].instantiate()
	add_child(_instantiated_level)
	var childs := _instantiated_level.get_children()
	for i in childs.size():
		if childs[i].is_in_group("characters"):
			childs[i].player_died.connect(_restart_level)
			break


func _delete_level():
	_instantiated_level.queue_free()
	
	
func _restart_level():
	_delete_level()
	_create_level.call_deferred(current_level)
	if current_level == 5:
		_under_construction.stop()
		_loop.play()

func next_level():
	if _secret_level == false:
		if current_level == 3:
			_loop.stop()
			_under_construction.play()
		if current_level == 4:
			get_tree().change_scene_to_file.call_deferred("res://scenes/menus/ending_screen.tscn")
		else:
			current_level += 1
			_restart_level()
	else:
		current_level = 5
		_restart_level()


func _music():
	_intro.add_to_group("music")
	_loop.add_to_group("music")
	_under_construction.add_to_group("music")
	
	_intro.finished.connect(_loop.play)
	if !_under_construction.playing:
		_loop.finished.connect(_loop.play)
