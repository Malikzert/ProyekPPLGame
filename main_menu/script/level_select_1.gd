extends Control

var max_unlocked_level := 1   # hanya Level 1 yg terbuka dulu

func _ready():
	setup_level_buttons()
	setup_back_button()
	modulate = Color(GlobalSettings.brightness, GlobalSettings.brightness, GlobalSettings.brightness, 1)
	if GlobalSettings.audio_player and not GlobalSettings.audio_player.playing:
		GlobalSettings.audio_player.play()
func setup_level_buttons():
	var index := 1

	for btn in $LevelButtons.get_children():
		if btn is TextureButton:

			# LOCK / UNLOCK efek blur
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
		1:
			LevelLoader.load_level_with_loading("res://stage 1/level 1-1/Stage1_Level1.tscn")
		2:
			LevelLoader.load_level_with_loading("res://stage 1/level 1-2/Stage1_Level2.tscn")
		3:
			LevelLoader.load_level_with_loading("res://stage 1/level 1-3/Stage1_Level3.tscn")
		4:
			LevelLoader.load_level_with_loading("res://stage 1/level 1-4/Stage1_Level4.tscn")
		5:
			LevelLoader.load_level_with_loading("res://stage 1/level 1-5/Stage1_Level5.tscn")
		_:
			print("Level ID tidak ditemukan:", level_id)



func setup_back_button():
	var back_btn = $back

	if back_btn == null:
		push_error("back tidak ditemukan di scene!")
		return

	back_btn.pressed.connect(_on_back_pressed)


func _on_back_pressed():
	print("Kembali ke StageSelect...")
	get_tree().change_scene_to_file("res://main_menu/scenes/StageSelect.tscn")
