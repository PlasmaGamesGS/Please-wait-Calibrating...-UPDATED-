extends Node2D

@export var _player: CharacterBody2D
@export var _secretRoom: TileMapLayer
@export var _passKey: Node2D


func _ready():
	_player.alt_gravity = true

#func _process(_delta: float) -> void:
	#if _player.position.x > 186:
		#_passKey.visible = true
		#_secretRoom.visible = false
