extends CharacterBody2D

@export var speed: float = 100
@export var move_range: float = 200
@export var jump_force: float = -400
@export var gravity: float = 900

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var origin_x: float
var direction := -1

func _ready():
	origin_x = position.x
	_random_jump_timer()

func _physics_process(delta):
	velocity.y += gravity * delta

	# Gerakan horizontal via velocity saja!
	velocity.x = speed * direction

	move_and_slide()

	# BATAS GERAK SETELAH move_and_slide()
	var dx = position.x - origin_x

	if dx >= move_range:
		_flip_direction()
	elif dx <= -move_range:
		_flip_direction()

# --------------------------
# Random Jump
# --------------------------
func _random_jump_timer():
	await get_tree().create_timer(randf_range(1.0, 3.0)).timeout
	_jump_random()
	_random_jump_timer()

func _jump_random():
	if is_on_floor():
		velocity.y = jump_force

# --------------------------
# Flip arah
# --------------------------
func _flip_direction():
	direction *= -1
	sprite.flip_h = direction > 0
