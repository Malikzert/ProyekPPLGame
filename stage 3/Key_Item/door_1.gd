extends StaticBody2D

@onready var collision = $CollisionPintuWhite
@onready var sprite = $Sprite2D

func try_open(player) -> bool:
	if not player.has_key:
		print("Player Tidak memiliki Key")
		return false
		
	print("Player memiliki key, Open Door")
	collision.call_deferred("set_disabled", true)
	
	if player.has_key:
		player.has_key = false
	return true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return

	print("Player enter area")

	if try_open(body):
		# ANIMASI MULTI-EFEK
		var tween = create_tween()
		tween.set_parallel(true)  # jalankan animasi bersamaan

		# 1. Menghilang dari atas ke bawah
		tween.tween_property(sprite, "scale:y", 0.0, 0.45)

		# 2. Fade out perlahan
		tween.tween_property(sprite, "modulate:a", 0.0, 0.45)

		# 3. Turun sedikit agar lebih dramatis
		tween.tween_property(sprite, "position:y", sprite.position.y + 20, 0.45)

		tween.set_parallel(false)

		# 4. Setelah selesai → hapus pintu
		tween.tween_callback(func(): queue_free())
