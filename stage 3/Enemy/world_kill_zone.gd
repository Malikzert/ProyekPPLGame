extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("You Died")
		timer.start()
	


func _on_timer_timeout() -> void:
	Global3.is_retry = true
	get_tree().reload_current_scene()
