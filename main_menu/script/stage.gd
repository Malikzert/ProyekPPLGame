extends Control

func _ready():
	print("StageSelect loaded!")

	# Tombol-tombol season
	var s1 = $stg1
	var s2 = $stg2
	var s3 = $stg3
	var back = $back
	modulate = Color(GlobalSettings.brightness, GlobalSettings.brightness, GlobalSettings.brightness, 1)
	if GlobalSettings.audio_player and not GlobalSettings.audio_player.playing:
		GlobalSettings.audio_player.play()
	# Connect tombol season
	s1.pressed.connect(_on_s1_pressed)
	s2.pressed.connect(_on_s2_pressed)
	s3.pressed.connect(_on_s3_pressed)

	# Connect tombol back
	back.pressed.connect(_on_back_pressed)


func _on_s1_pressed():
	print("Season 1 clicked!")
	get_tree().change_scene_to_file("res://main_menu/scenes/LevelSelect1.tscn")

func _on_s2_pressed():
	print("Season 2 clicked!")
	get_tree().change_scene_to_file("res://main_menu/scenes/LevelSelect2.tscn")

func _on_s3_pressed():
	print("Season 3 clicked!")
	get_tree().change_scene_to_file("res://main_menu/scenes/LevelSelect3.tscn")

func _on_back_pressed():
	print("back to main menu")
	get_tree().change_scene_to_file("res://main_menu/scenes/MainMenu.tscn")
