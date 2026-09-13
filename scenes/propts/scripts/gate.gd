extends StaticBody2D

var opened: bool


@export var collision: CollisionShape2D
@export var animation: AnimationPlayer
@export var key: AnimatedSprite2D
@export var player: CharacterBody2D

func _process(_delta: float) -> void:
	if SaveFile.hasPassKey:
		key.visible = true
		key.play("pressing")
		if Input.is_action_just_pressed("debugOpenGate") && animation.is_playing() == false:
			if !opened:
				animation.play("open")
				opened = true
			else:
				animation.play("close")
				opened = false
