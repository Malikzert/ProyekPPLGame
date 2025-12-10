extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(5)
	


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
