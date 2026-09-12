extends StaticBody2D

var opened: bool


@export var collision: CollisionShape2D
@export var animation: AnimationPlayer
@export var player: CharacterBody2D

func _physics_process(_delta: float) -> void:
	pass
	if Input.is_action_just_pressed("debugOpenGate") && SaveFile.hasPassKey:
		if !opened:
			animation.play("open")
			opened = true
		else:
			animation.play("close")
			opened = false
