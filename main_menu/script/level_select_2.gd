extends Control

var max_unlocked_level := 1   # Level awal terbuka

func _ready():
	setup_level_buttons()
	setup_back_button()
	modulate = Color(GlobalSettings.brightness, GlobalSettings.brightness, GlobalSettings.brightness, 1)
	if GlobalSettings.audio_player and not GlobalSettings.audio_player.playing:
		GlobalSettings.audio_player.play()
func setup_level_buttons():
	var index := 1

	for btn in $LevelButton2.get_children():
		if btn is TextureButton:

			if index <= max_unlocked_level:
				btn.disabled = false
				btn.modulate = Color(1, 1, 1, 1)
			else:
				btn.disabled = true
				btn.modulate = Color(1, 1, 1, 0.35)

			btn.pressed.connect(_on_level_pressed.bind(index))
			index += 1


func _on_level_pressed(level_id: int):
	print("Loading Level:", level_id)

	match level_id:
		1: get_tree().change_scene_to_file("res://stage 2/level 2-1/Stage2_Level1.tscn")
		2: get_tree().change_scene_to_file("res://stage 2/level 2-2/Stage2_Level2.tscn")
		3: get_tree().change_scene_to_file("res://stage 2/level 2-3/Stage2_Level3.tscn")
		4: get_tree().change_scene_to_file("res://stage 2/level 2-4/Stage2_Level4.tscn")
		5: get_tree().change_scene_to_file("res://stage 2/level 2-5/Stage2_Level5.tscn")
		_:
			print("Level ID tidak ditemukan:", level_id)


func setup_back_button():
	var back_btn = $back
	if back_btn == null:
		push_error("back tidak ditemukan di LevelSelect2!")
		return
	back_btn.pressed.connect(_on_back_pressed)


func _on_back_pressed():
	get_tree().change_scene_to_file("res://main_menu/scenes/StageSelect.tscn")
