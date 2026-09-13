extends Node2D

@export var sprite: AnimatedSprite2D


func _ready():
	sprite.frame = 0
	await get_tree().create_timer(0.5).timeout
	sprite.frame = 1
