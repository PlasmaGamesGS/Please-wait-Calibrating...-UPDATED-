extends Control

@export var titleScreen: PackedScene


func _on_quit_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/title_screen.tscn")
