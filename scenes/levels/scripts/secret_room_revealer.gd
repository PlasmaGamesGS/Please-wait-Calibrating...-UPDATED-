extends Node2D

@export var secretRoom: TileMapLayer
@export var passKey: Node2D

var discovered: bool

func _on_body_entered(_body: CharacterBody2D) -> void:
	if !discovered:
		passKey.visible = true
		secretRoom.visible = false
		discovered = true
