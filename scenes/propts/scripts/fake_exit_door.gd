extends Node2D

@export var area_2d: Area2D
@export var exit_door: Node2D
@export var sprite: Sprite2D
@export var desaturatedMaterial: ShaderMaterial


func _ready() -> void:
	area_2d.body_entered.connect(_fake_exit)


func _fake_exit(_body: Node2D) -> void:
	sprite.material = desaturatedMaterial
	exit_door.visible = true
