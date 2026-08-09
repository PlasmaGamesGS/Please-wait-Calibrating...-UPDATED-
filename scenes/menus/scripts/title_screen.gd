extends Control

@export var main_scene: PackedScene


func _on_play_button_up() -> void:
	get_tree().change_scene_to_packed(main_scene)

func _on_options_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/options_screen.tscn")

func _on_quit_button_up() -> void:
	get_tree().quit()
