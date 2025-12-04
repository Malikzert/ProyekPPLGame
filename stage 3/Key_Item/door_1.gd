extends StaticBody2D

@onready var collision = $CollisionPintuWhite
@onready var sprite = $Sprite2D
@onready var tween = create_tween()

func try_open(player):
	if not player.has_key:
		print("Player Tidak memiliki Key")
	if player.has_key:
		print("Player memiliki key, Open Door")
		collision.disabled = true
		collision.call_deferred("set_disabled", true)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("Player enter area")
		try_open(body)
		tween.tween_property(sprite, "scale:y", 0.0, 0.6)
		tween.tween_callback(func():queue_free())
