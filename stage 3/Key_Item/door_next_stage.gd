extends Node2D

@export var next_stage_path: String
@export var delay_before_enter: float = 2.0
@export var fade_duration: float = 0.7

var entering := false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if entering:
		return

	if body.name == "Player":
		entering = true
		_start_transition()

func _start_transition():
	await get_tree().create_timer(delay_before_enter).timeout

	var canvas_layer = CanvasLayer.new()
	var color_rect = ColorRect.new()
	
	color_rect.color = Color(0, 0, 0, 0)
	color_rect.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	
	canvas_layer.add_child(color_rect)
	add_child(canvas_layer)

	var tween = create_tween()
	tween.tween_property(color_rect, "color:a", 1.0, fade_duration)

	await tween.finished

	if next_stage_path != "":
		get_tree().change_scene_to_file(next_stage_path)
	else:
		print("Error: Next Stage Path kosong!")
