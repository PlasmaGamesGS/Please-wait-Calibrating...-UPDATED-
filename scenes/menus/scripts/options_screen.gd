extends Control

@export var valueX: Label
@export var valueY: Label
var xResolution: Array = [1152, 1280, 1360, 1920]
var yResolution: Array = [648, 720, 768, 1080]
var resValue: int = 1

func _process(delta: float) -> void:
	#DisplayServer.window_set_size(Vector2(xResolution[resValue], yResolution[resValue]))
	ProjectSettings.set_setting("display/window/size/width",xResolution[resValue])
	ProjectSettings.set_setting("display/window/size/height",yResolution[resValue])
	valueX.text = str(xResolution[resValue])
	valueY.text = str(yResolution[resValue])


func _on_back_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/title_screen.tscn")


func _on_increase_button_down() -> void:
	if resValue == 3:
		resValue = 3
	else:
		resValue += 1


func _on_decrease_button_down() -> void:
	if resValue == 0:
		resValue = 0
	else:
		resValue -= 1
