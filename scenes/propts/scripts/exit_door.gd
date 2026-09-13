extends Node2D

@export var area_2d: Area2D
@export var sprite: AnimatedSprite2D 
@export var key: AnimatedSprite2D

var opened: bool

func _ready() -> void:
	add_to_group("exit_doors")
	area_2d.body_entered.connect(_open)
	area_2d.body_exited.connect(_close)
	
	if get_parent().get_parent()._current_level == 0:
		key.visible = true
		key.play("pressing")

func _open(_body: CharacterBody2D) -> void:
	if visible:
		sprite.frame = 1
		_body.opening = true
		opened = true

func _process(_delta: float) -> void:
	if opened:
		key.visible = true
		key.play("pressing")
		
		if Input.is_action_just_pressed("openDoor"):
			get_parent().get_parent().next_level()
	
	elif get_parent().get_parent()._current_level != 0:
		key.visible = false
		key.stop()


func _close(_body: CharacterBody2D) -> void:
	sprite.frame = 0
	_body.opening = false
	opened = false
