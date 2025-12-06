extends Node2D

const SPEED = 60
var direction := 1
var can_check_floor := true

@onready var floor_checker: RayCast2D = $FloorChecker
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var right: RayCast2D = $Right
@onready var left: RayCast2D = $Left




var initial_cast_pos_x := 0.0

func _ready():
	initial_cast_pos_x = floor_checker.position.x


func _physics_process(delta):
	# Gerak biasa
	position.x += direction * SPEED * delta

	# Cegah spam cek lantai
	if not can_check_floor:
		return

	# Cek lantai
	if not floor_checker.is_colliding():
		await _flip_with_delay()
		
	if right.is_colliding():
		await _flip_with_delay()
	
	if left.is_colliding():
		await _flip_with_delay()


func _flip_with_delay():
	can_check_floor = false

	_flip_direction()

	# beri waktu enemy menjauh dari tepi
	await get_tree().create_timer(0.2).timeout

	can_check_floor = true


func _flip_direction():
	direction *= -1
	sprite.flip_h = direction < 0

	# geser RayCast ke sisi baru + offset
	floor_checker.position.x = (initial_cast_pos_x * direction) + (5 * direction)
