extends CharacterBody2D

signal player_died

var _speed: float = 100.0 
var _jump_speed: float = -300.0

var gravity: Vector2
var _size = get_scale()

var _alive: bool = true
var alt_gravity: bool
var _alt_size: bool
var stair: bool
var opening: bool

var _new_size: float


@export var animation: AnimatedSprite2D
@export var area_2d: Area2D
@export var EnDoorPosition: Node2D
@export var constParticles: CPUParticles2D
@export var errorParticles: GPUParticles2D
@export var deathParticles: GPUParticles2D

func _ready():
	_partPreload()

	position = EnDoorPosition.position
	area_2d.body_entered.connect(_damaged)

	if alt_gravity:
		scale.y = - scale.y

func _process(delta):
	if !_alive:
		return

#idle y abrir
	if velocity == Vector2(0, 0):
		if opening:
			animation.play("openingDoor")
		else:
			animation.play("idle")

	#movimiento horizontal
	if Input.is_action_pressed("right"):
		animation.flip_h = false
		constParticles.position.x = 4
		velocity.x = _speed
		if velocity.y == 0:
			animation.play("run")

	elif Input.is_action_pressed("left"):
		animation.flip_h = true
		constParticles.position.x = -6
		velocity.x = -_speed
		if velocity.y == 0:
			animation.play("run")
		
	else:
		velocity.x = 0

	#gravedad
	if stair:
		if velocity.y == 0:
			gravity = Vector2(0, 0)
	elif alt_gravity:
		gravity = -get_gravity()
		#constParticles.emitting = true
	else:
		gravity = get_gravity()
		#constParticles.emitting = false
	velocity += gravity * delta
	
	#salto
	if Input.is_action_pressed("jump"):
		if alt_gravity == false && is_on_floor():
			stair = false
			velocity.y = _jump_speed
			animation.play("jump")
		elif alt_gravity && is_on_ceiling():
			stair = false
			velocity.y = -_jump_speed
			animation.play("jump")
		


	#escalar
	if stair:
		if velocity.y == 0:
			if Input.is_action_pressed("up"):
				position.y -= 2
			elif Input.is_action_pressed("down"):
				position.y += 2

	move_and_slide()



#recibir daño y morir
func _damaged(_body: Node2D) -> void:
	animation.visible = false
	_alive = false
	animation.stop()
	deathParticles.visible = true
	deathParticles.emitting = true
	await get_tree().create_timer(1).timeout
	player_died.emit()


#preloading particles to prevent lag
func _partPreload():
	if get_parent().get_parent().current_level == 0:
		errorParticles.emitting = true
		deathParticles.emitting = true
		errorParticles.restart()
		deathParticles.restart()

#modificador de gravedad
func _mod_gravity():
	errorParticles.restart()
	errorParticles.self_modulate = Color("ff7d00")
	errorParticles.visible = true
	errorParticles.emitting = true
	await get_tree().create_timer(0.2).timeout
	scale.y = - scale.y
	errorParticles.emitting = false
	if !alt_gravity:
		alt_gravity = true
	else:
		alt_gravity = false

#shhhh irrelevant
func _mod_size():
	if !_alt_size:
		_alt_size = true
		scale *= _new_size
	else:
		_alt_size = false
		scale = _size
	@warning_ignore("narrowing_conversion")
	deathParticles.amount *= scale.x
	errorParticles.self_modulate = Color("00ff15ff")
	errorParticles.visible = true
	errorParticles.emitting = true
	await get_tree().create_timer(0.2).timeout
	errorParticles.emitting = false
