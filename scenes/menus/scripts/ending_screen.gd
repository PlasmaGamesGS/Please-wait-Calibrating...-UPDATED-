extends Control

@export var titleScreen: PackedScene
@export var titleScreenButton: Button

func _ready() -> void:
	titleScreenButton.grab_focus()

func _on_title_screen_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/title_screen.tscn")
