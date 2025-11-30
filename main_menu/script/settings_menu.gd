extends Control

@onready var music_slider: HSlider = $MusicVolumeSlider
@onready var brightness_slider: HSlider = $BrightnessSlider
@onready var music_dropdown: OptionButton = $MusicDropdown
@onready var back_btn: TextureButton = $back
@onready var bg1: AudioStreamPlayer = $background1
@onready var bg2: AudioStreamPlayer = $background2
# Daftar musik yang tersedia
var music_list = {
	"Background 1": "res://assets/music/retro-game-arcade-236133.mp3",
	"Background 2": "res://assets/music/retro-lounge-389644.mp3",
	"disable": ""
}

func _ready():
	# load nilai dari GlobalSettings
	load_settings()
	GlobalSettings.set_audio_player(bg1)
	# event slider
	music_slider.value_changed.connect(_on_music_changed)
	brightness_slider.value_changed.connect(_on_brightness_changed)

	# event dropdown musik
	music_dropdown.item_selected.connect(_on_music_selected)
	_populate_music_dropdown()

	# tombol back
	back_btn.pressed.connect(_on_back_pressed)

	# mulai musik jika belum diputar
	if GlobalSettings.audio_player and not GlobalSettings.audio_player.playing:
		GlobalSettings.audio_player.play()


# -------------------------
# POPULATE DROPDOWN
# -------------------------
func _populate_music_dropdown():
# putuskan sambungan sementara
	music_dropdown.disconnect("item_selected", Callable(self, "_on_music_selected"))
	music_dropdown.clear()

	var index = 0
	for key in music_list.keys():
		music_dropdown.add_item(key, index)
		if GlobalSettings.music_path == music_list[key]:
			music_dropdown.select(index)
			index += 1

	# sambungkan kembali setelah populate
		music_dropdown.item_selected.connect(_on_music_selected)
# -------------------------
# MUSIC DROPDOWN HANDLER
# -------------------------
# -------------------------
# MUSIC DROPDOWN HANDLER
# -------------------------
func _on_music_selected(index: int):
	var key = music_dropdown.get_item_text(index)
	var path = music_list[key]
	GlobalSettings.set_music(path)



# -------------------------
# VOLUME HANDLER
# -------------------------
func _on_music_changed(value: float):
	GlobalSettings.set_volume(value)


# -------------------------
# BRIGHTNESS HANDLER
# -------------------------
func _on_brightness_changed(value: float):
	GlobalSettings.set_brightness(value)


# -------------------------
# LOAD SETTINGS
# -------------------------
func load_settings():
	# Ambil dari GlobalSettings Autoload
	music_slider.value = GlobalSettings.volume
	brightness_slider.value = GlobalSettings.brightness

	# Set volume global
	AudioServer.set_bus_volume_db(
		AudioServer.get_bus_index("Master"),
		linear_to_db(GlobalSettings.volume)
	)

	# Set brightness pada scene ini
	self.modulate = Color(
		GlobalSettings.brightness,
		GlobalSettings.brightness,
		GlobalSettings.brightness,
		1
	)


# -------------------------
# BACK BUTTON
# -------------------------
func _on_back_pressed():
	get_tree().change_scene_to_file("res://main_menu/scenes/MainMenu.tscn")
