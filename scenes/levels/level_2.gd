extends Node2D

@export var _player: CharacterBody2D

func _ready():
	_player.alt_gravity = true
