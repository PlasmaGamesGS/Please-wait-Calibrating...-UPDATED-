extends Node2D

@export var area2d: Area2D


func _ready():
	area2d.body_entered.connect(_pickedUp)


func _pickedUp(_body):
	#queue_free()
	position.x += 5
	await  get_tree().create_timer(0.1).timeout
	position.x -= 10
	await  get_tree().create_timer(0.1).timeout
	position.x += 5
	#SaveFile.hasPassKey = true
