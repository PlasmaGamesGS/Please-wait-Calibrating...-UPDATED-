extends Node2D

@export var secret_area: Area2D


func _ready() -> void:
	secret_area.body_entered.connect(_secret)

func _secret(_body: Node2D) -> void:
	get_parent().get_parent()._current_level = 5
	get_parent().get_parent().next_level()
