extends Control

@export var main_scene: PackedScene


func _on_play_button_up() -> void:
	get_tree().change_scene_to_packed(main_scene)

func _on_options_button_up() -> void:
	pass # Replace with function body.

func _on_quit_button_up() -> void:
	get_tree().quit()
