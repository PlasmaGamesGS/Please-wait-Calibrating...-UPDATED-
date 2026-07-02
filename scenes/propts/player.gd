extends CharacterBody2D

signal player_died

var _speed: float = 100.0 

var _jump_speed: float = -300.0
var _alive: bool = true
var gravity: Vector2
var alt_gravity: bool
var _alt_size: bool
var stair: bool
var _size: Vector2 = Vector2(1, 1)
var _new_size: int = 3

@export var animation: AnimatedSprite2D
@export var area_2d: Area2D
@export var EnDoorPosition: Node2D

func _ready():
	scale = _size
	position = EnDoorPosition.position
	add_to_group("characters")
	area_2d.body_entered.connect(_damaged)


func _physics_process(delta):
	if !_alive:
		return
	
	if velocity == Vector2(0, 0):
		animation.play("idle")
	
	#movimiento horizontal
	if Input.is_action_pressed("right"):
		animation.flip_h = false
		velocity.x = _speed
		if velocity.y == 0:
			animation.play("run")

	elif Input.is_action_pressed("left"):
		animation.flip_h = true
		velocity.x = -_speed
		if velocity.y == 0:
			animation.play("run")
		
	else:
		velocity.x = 0

	#gravedad
	if stair:
		gravity = Vector2(0, 0)
	elif alt_gravity:
		gravity = -get_gravity()
	else:
		gravity = get_gravity()
	velocity += gravity * delta
	
	if alt_gravity:
		scale.y = - _size.y
	else:
		scale.y = _size.y
	
	#salto
	if Input.is_action_pressed("jump"):
		if alt_gravity == false && is_on_floor() && !stair:
			animation.play("jump")
			velocity.y = _jump_speed
			
		elif alt_gravity && is_on_ceiling():
			animation.play("jump")
			velocity.y = -_jump_speed

	#escalar
	if stair:
		if Input.is_action_pressed("up"):
			position.y -= 2
		elif Input.is_action_pressed("down"):
			position.y += 2

	move_and_slide()



#recibir daño y morir
func _damaged(_body: Node2D) -> void:
	animation.modulate = Color(0.25, 0.25, 0.25, 1.0)
	_alive = false
	animation.stop()
	await get_tree().create_timer(1).timeout
	player_died.emit()



func _mod_gravity():
	for i in 2:
		animation.modulate = Color(1.0, 0.492, 0.0, 1.0)
		await get_tree().create_timer(0.05).timeout
		animation.modulate = self.modulate
		await get_tree().create_timer(0.05).timeout
	if !alt_gravity:
		alt_gravity = true
	else:
		alt_gravity = false


func _mod_size():
	for i in 2:
		if !_alt_size:
			_alt_size = true
			scale = _size * _new_size
		else:
			_alt_size = false
			scale = _size
		animation.modulate = Color(0.0, 1.0, 0.083, 1.0)
		await get_tree().create_timer(0.05).timeout
		animation.modulate = self.modulate
		await get_tree().create_timer(0.05).timeout
