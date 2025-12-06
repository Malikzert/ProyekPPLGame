extends Node2D

@export var speed: float = 200
@export var range_distance: float = 150

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var origin_x: float
var direction := -1

func _ready():
	origin_x = position.x   # simpan posisi awal

func _process(delta):
	# bergerak horizontal
	position.x += speed * direction * delta

	# ping-pong relatif dari posisi awal
	if position.x >= origin_x + range_distance:
		direction = -1
		animated_sprite_2d.flip_h = false     # flip horizontal
	elif position.x <= origin_x - range_distance:
		direction = 1
		animated_sprite_2d.flip_h = true
