extends Control

var StartButton: Button
var SettingButton: Button
var ExitButton: Button

func _ready():
	# Ambil node langsung dari tree
	StartButton = $StartButton
	SettingButton = $SettingButton
	ExitButton = $ExitButton
	modulate = Color(GlobalSettings.brightness, GlobalSettings.brightness, GlobalSettings.brightness, 1)
	if GlobalSettings.audio_player and not GlobalSettings.audio_player.playing:
		GlobalSettings.audio_player.play()

	# Cek apakah semua tombol ditemukan
	if not StartButton:
		push_error("StartButton tidak ditemukan!")
	if not SettingButton:
		push_error("SettingButton tidak ditemukan!")
	if not ExitButton:
		push_error("ExitButton tidak ditemukan!")

	# Hubungkan tombol ke fungsi masing-masing
	StartButton.pressed.connect(_on_StartButton_pressed)
	SettingButton.pressed.connect(_on_SettingButton_pressed)
	ExitButton.pressed.connect(_on_ExitButton_pressed)

func _on_StartButton_pressed():
	get_tree().change_scene_to_file("res://main_menu/scenes/StageSelect.tscn")

func _on_SettingButton_pressed():
	get_tree().change_scene_to_file("res://main_menu/scenes/SettingsMenu.tscn")

func _on_ExitButton_pressed():
	var confirm = preload("res://main_menu/scenes/ExitConfirm.tscn").instantiate()
	add_child(confirm)
