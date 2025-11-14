extends Control

var StartButton: Button
var SettingButton: Button
var ExitButton: Button

func _ready():
	# Ambil node langsung dari tree
	StartButton = $StartButton
	SettingButton = $SettingButton
	ExitButton = $ExitButton

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
	get_tree().change_scene_to_file("res://stage1/level1/Stage1_Level1.tscn")

func _on_SettingButton_pressed():
	print("Tombol Setting ditekan")

func _on_ExitButton_pressed():
	var confirm = preload("res://main_menu/scenes/ExitConfirm.tscn").instantiate()
	add_child(confirm)
