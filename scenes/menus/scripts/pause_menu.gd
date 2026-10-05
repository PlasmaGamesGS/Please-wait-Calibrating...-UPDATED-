extends Control

signal togglePause


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		togglePause.emit()

func _on_toggle_pause() -> void:
		visible = !visible
		if get_tree().paused:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			Input.warp_mouse(get_parent().mousePos)
		get_tree().paused = !get_tree().paused
		_music()


func _music():
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

#buttons
func _on_resume_button_up() -> void:
	togglePause.emit()
