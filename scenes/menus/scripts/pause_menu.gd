extends Node

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		if get_tree().paused:
			var childs := get_parent().get_children()
			for i in childs.size():
				if childs[i].is_in_group("music"):
					childs[i].volume_db = -5
					childs[i].pitch_scale = 0.5
		else:
			var childs := get_parent().get_children()
			for i in childs.size():
				if childs[i].is_in_group("music"):
					childs[i].volume_db = 1.0
					childs[i].pitch_scale = 1.0
