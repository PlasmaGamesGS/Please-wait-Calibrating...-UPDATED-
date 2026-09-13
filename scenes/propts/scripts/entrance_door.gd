extends Node2D

@export var sprite: AnimatedSprite2D


func _ready():
	await get_tree().create_timer(0.5).timeout
	sprite.frame = 1
