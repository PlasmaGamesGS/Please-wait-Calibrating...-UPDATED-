extends StaticBody2D

@export var player: CharacterBody2D
@export var collision: CollisionShape2D


func _process(_delta: float) -> void:
	if player.alt_gravity:
		collision.scale.y = -1
	else:
		collision.scale.y = 1
	
	if Input.is_action_just_pressed("down"):
		collision.disabled = true
		await get_tree().create_timer(0.1).timeout
		collision.disabled = false
