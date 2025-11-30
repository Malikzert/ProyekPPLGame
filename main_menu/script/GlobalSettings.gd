extends Node

# -----------------------------
# Global Settings
# -----------------------------
var volume: float = 1.0
var brightness: float = 1.0
var music_path: String = ""

# node AudioStreamPlayer akan diassign dari scene SettingsMenu
var audio_player: AudioStreamPlayer


func _ready():
	audio_player = AudioStreamPlayer.new()
	add_child(audio_player)
	audio_player.bus = "Master"
	audio_player.autoplay = false
	audio_player.volume_db = 0

# -----------------------------
# Assign node AudioStreamPlayer dari SettingsMenu
# -----------------------------
func set_audio_player(player: AudioStreamPlayer):
	audio_player = player
	if audio_player:
		audio_player.volume_db = linear_to_db(volume)
		# mulai musik jika sudah ada musik yang dipilih
		if music_path != "":
			set_music(music_path)

# -----------------------------
# Ganti musik
# -----------------------------
func set_music(path: String):
	if not audio_player:
		return

	music_path = path
	audio_player.stop()
	audio_player.stream = load(path)
	audio_player.play()

# -----------------------------
# Set volume
# -----------------------------
func set_volume(value: float):
	volume = value
	if audio_player:
		audio_player.volume_db = linear_to_db(volume)

# -----------------------------
# Set brightness scene saat ini
# -----------------------------
func set_brightness(value: float):
	brightness = value
	var root = get_tree().current_scene
	if root:
		root.modulate = Color(value, value, value, 1)
