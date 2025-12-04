extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		print("Player enter area")
		get_parent().try_open(body)
