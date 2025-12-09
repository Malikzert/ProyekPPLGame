extends Node2D

@export var next_stage_path: String   # diisi di inspector
@export var delay_before_enter: float = 2.0
@export var fade_duration: float = 0.7

var entering := false

@onready var sprite: Sprite2D = $Sprite2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	print("something enterred")
	if entering:
		return  # biar tidak double trigger

	if body.name == "Player":
		print("body enterd")
		entering = true
		_start_transition() # Replace with function body.



func _start_transition():
	# Tunggu delay sebelum fade
	await get_tree().create_timer(delay_before_enter).timeout

	# Fade-out hanya sprite pintu
	var tween = create_tween()
	tween.tween_property(sprite, "modulate:a", 0.0, fade_duration)

	await tween.finished

	# Pindah stage
	if next_stage_path != "":
		get_tree().change_scene_to_file(next_stage_path)
