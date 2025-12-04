extends Control

@export var next_scene_path: String = ""

func _ready():
	modulate.a = 0.0
	fade_in()
	load_scene_process()
	modulate = Color(GlobalSettings.brightness, GlobalSettings.brightness, GlobalSettings.brightness, 1)

func fade_in():
	var t := 0.0
	while t < 1.0:
		t += 0.05
		modulate.a = t
		await get_tree().process_frame

func load_scene_process():
	var progress := 0
	while progress < 100:
		progress += 2
		$ProgressBar.value = progress
		await get_tree().create_timer(0.03).timeout

	await fade_out()
	get_tree().change_scene_to_file(next_scene_path)

func fade_out():
	var t := 1.0
	while t > 0:
		t -= 0.05
		modulate.a = t
		await get_tree().process_frame
