extends TextureRect

@export var speed: float = 30.0  # pixel per detik
var direction: int = 1  
var timer: float = 0.0
var switch_time: float = 8.0  

func _process(delta):
	if not texture:
		return

	position.x += speed * delta * direction

	# Update timer
	timer += delta
	if timer >= switch_time:
		direction *= -1  # balik arah
		timer = 0.0
