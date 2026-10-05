extends Control

@export var main_scene: PackedScene
@export var playButton: Button
@export var quitButton: Button
@export var PnPopup: Control
@export var UnPopup: Control

#func _ready() -> void:
	#playButton.grab_focus()
#
#func _process(_delta: float) -> void:
	#_buttons()
#
#
#func _buttons():
	#if playButton.has_focus():
		#await get_tree().create_timer(0.1).timeout
		#if Input.is_action_just_pressed("ui_up"):
			#quitButton.grab_focus()
	#if quitButton.has_focus():
		#await get_tree().create_timer(0.1).timeout
		#if Input.is_action_just_pressed("ui_down"):
			#playButton.grab_focus()

func _on_play_button_up() -> void:
	get_tree().change_scene_to_packed(main_scene)

func _on_options_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/options_screen.tscn")

func _on_quit_button_up() -> void:
	get_tree().quit()


#socials

func _on_itch_button_up() -> void:
	OS.shell_open("https://plasmagamez.itch.io")

func _on_git_hub_button_up() -> void:
	OS.shell_open("https://github.com/PlasmaGamesGS")

func _on_patreon_button_up() -> void:
	OS.shell_open("https://www.patreon.com/cw/plasmagamedev")

func _on_kickstarter_button_up() -> void:
	OS.shell_open("https://www.kickstarter.com/profile/plasmagames")

func _on_youtube_button_up() -> void:
	OS.shell_open("https://www.youtube.com/@plasmagamedev")

func _on_x_button_up() -> void:
	OS.shell_open("https://x.com/plasmagamesdev")

func _on_tiktok_button_up() -> void:
	OS.shell_open("https://www.tiktok.com/@plasmagamesdev")

func _on_instagram_button_up() -> void:
	OS.shell_open("https://www.instagram.com/plasmagamesdev/")


#patch and update notes

func _on_patch_indicator_button_up() -> void:
	PnPopup.visible = true

func _on_itch_patchnotes_button_up() -> void:
	OS.shell_open("https://plasmagamedev.itch.io/please-wait-calibrating/devlog/1689194/patch-a00211026rc1-the-graphic-update-hotfix")

func _on_github_patchnotes_button_up() -> void:
	OS.shell_open("https://github.com/PlasmaGamesGS/Please-wait-Calibrating...-UPDATED-/releases/tag/Patch_A0.0.2.1%2F10.26%2FrC1")


func _on_version_indicator_button_up() -> void:
	UnPopup.visible = true

func _on_itch_updatenotes_button_up() -> void:
	OS.shell_open("https://plasmagamedev.itch.io/please-wait-calibrating/devlog/1666417/update-a0020826rc1-the-graphic-update")

func _on_github_updatenotes_button_up() -> void:
	OS.shell_open("https://github.com/PlasmaGamesGS/Please-wait-Calibrating...-UPDATED-/releases/tag/Alpha-0.0.2")

func _on_youtube_update_trailer_button_up() -> void:
	OS.shell_open("https://www.youtube.com/watch?v=J2DZSJhqpuY&list=PLLwvV6ShZfrc&index=1")


func _on_close_button_up() -> void:
	PnPopup.visible = false
	UnPopup.visible = false
