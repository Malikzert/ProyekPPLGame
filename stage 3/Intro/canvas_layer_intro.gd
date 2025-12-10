extends CanvasLayer

@export var stage_name: String = "STAGE 1-1"
@export var hold_time: float = 2.0
@export var fade_duration: float = 1.0

@onready var label = $CenterContainer/Label
@onready var background = $ColorRect

func _ready():
	if Global3.is_retry:
		Global3.is_retry = false
		queue_free()
		return
	label.text = stage_name
	
	background.color.a = 1.0
	label.modulate.a = 1.0
	
	await get_tree().create_timer(hold_time).timeout
	
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(background, "color:a", 0.0, fade_duration)
	tween.tween_property(label, "modulate:a", 0.0, fade_duration)
	
	await tween.finished
	queue_free()
