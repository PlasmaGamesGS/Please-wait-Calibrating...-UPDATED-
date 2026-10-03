extends Control

@export var main_scene: PackedScene
@export var playButton: Button
@export var quitButton: Button

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	playButton.grab_focus()

func _process(_delta: float) -> void:
	if playButton.has_focus():
		await get_tree().create_timer(0.1).timeout
		if Input.is_action_just_pressed("ui_up"):
			quitButton.grab_focus()
	if quitButton.has_focus():
		await get_tree().create_timer(0.1).timeout
		if Input.is_action_just_pressed("ui_down"):
			playButton.grab_focus()

func _on_play_button_up() -> void:
	get_tree().change_scene_to_packed(main_scene)

func _on_options_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/options_screen.tscn")

func _on_quit_button_up() -> void:
	get_tree().quit()
