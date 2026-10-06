extends Control

@export var main_scene: PackedScene

@export var playButton: Button
@export var optionsButton: Button
@export var quitButton: Button

@export var itch: Button
@export var itchPatch: Button
@export var itchUpdate: Button
@export var github: Button
@export var githubPatch: Button
@export var githubUpdate: Button
@export var patreon: Button
@export var kickstarter: Button
@export var youtube: Button
@export var youtubeTrailer: Button
@export var x: Button
@export var tiktok: Button
@export var instagram: Button

@export var PnPopup: Control
@export var UnPopup: Control

@export var playSprite: AnimatedSprite2D
@export var optionsSprite: AnimatedSprite2D
@export var quitSprite: AnimatedSprite2D

#func _ready() -> void:
	#playButton.grab_focus()

func _process(_delta: float) -> void:
	_buttons()
	_socialsButtons()


func _buttons():
	if playButton.button_pressed:
		playSprite.animation = "press"
	elif playButton.has_focus() or playButton.is_hovered():
		playSprite.animation = "hover"
	else:
		playSprite.animation = "idle"
		#await get_tree().create_timer(0.1).timeout
		#if Input.is_action_just_pressed("ui_up"):
			#quitButton.grab_focus()
	
	if optionsButton.button_pressed:
		optionsSprite.animation = "press"
	elif optionsButton.has_focus() or optionsButton.is_hovered():
		optionsSprite.animation = "hover"
	else:
		optionsSprite.animation = "idle"
	
	if quitButton.button_pressed:
		quitSprite.animation = "press"
	elif quitButton.has_focus() or quitButton.is_hovered():
		quitSprite.animation = "hover"
	else:
		quitSprite.animation = "idle"
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

func _socialsButtons():
	if itch.is_hovered():
		itch.get_parent().frame = 1
	else:
		itch.get_parent().frame = 0
	
	if itchPatch.is_hovered():
		itchPatch.get_parent().frame = 1
	else:
		itchPatch.get_parent().frame = 0
	
	if itchUpdate.is_hovered():
		itchUpdate.get_parent().frame = 1
	else:
		itchUpdate.get_parent().frame = 0
	
	if github.is_hovered():
		github.get_parent().frame = 1
	else:
		github.get_parent().frame = 0
	
	if githubPatch.is_hovered():
		githubPatch.get_parent().frame = 1
	else:
		githubPatch.get_parent().frame = 0
	if githubUpdate.is_hovered():
		githubUpdate.get_parent().frame = 1
	else:
		githubUpdate.get_parent().frame = 0
	
	if patreon.is_hovered():
		patreon.get_parent().frame = 1
	else:
		patreon.get_parent().frame = 0
	
	if kickstarter.is_hovered():
		kickstarter.get_parent().frame = 1
	else:
		kickstarter.get_parent().frame = 0
	
	if youtube.is_hovered():
		youtube.get_parent().frame = 1
	else:
		youtube.get_parent().frame = 0
	
	if youtubeTrailer.is_hovered():
		youtubeTrailer.get_parent().frame = 1
	else:
		youtubeTrailer.get_parent().frame = 0
	
	if x.is_hovered():
		x.get_parent().frame = 1
	else:
		x.get_parent().frame = 0
	
	if tiktok.is_hovered():
		tiktok.get_parent().frame = 1
	else:
		tiktok.get_parent().frame = 0
	
	if instagram.is_hovered():
		instagram.get_parent().frame = 1
	else:
		instagram.get_parent().frame = 0


func _on_itch_button_up() -> void:
	OS.shell_open("https://plasmagamez.itch.io")

func _on_github_button_up() -> void:
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
	OS.shell_open(VersionDetails.patchNotesItch)
	PnPopup.visible = false

func _on_github_patchnotes_button_up() -> void:
	OS.shell_open(VersionDetails.patchNotesGithub)
	PnPopup.visible = false


func _on_version_indicator_button_up() -> void:
	UnPopup.visible = true

func _on_itch_updatenotes_button_up() -> void:
	OS.shell_open(VersionDetails.updateNotesItch)
	UnPopup.visible = false

func _on_github_updatenotes_button_up() -> void:
	OS.shell_open(VersionDetails.updateNotesGithub)
	UnPopup.visible = false

func _on_youtube_update_trailer_button_up() -> void:
	OS.shell_open(VersionDetails.youtubeTrailer)
	UnPopup.visible = false


func _on_close_button_up() -> void:
	PnPopup.visible = false
	UnPopup.visible = false
