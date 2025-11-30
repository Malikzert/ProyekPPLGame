extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const MAX_AIR_JUMP = 1

var air_jumps = 0

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_floor():
		air_jumps = 0

	# Jump
	if Input.is_action_just_pressed("move_up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif air_jumps < MAX_AIR_JUMP:
			velocity.y = JUMP_VELOCITY
			air_jumps += 1

	# Movement
	var direction := Input.get_axis("move_left", "move_right")
	if direction != 0:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# ----------------------------
	# ANIMATION SYSTEM
	# ----------------------------
	var sprite = $AnimatedSprite2D

	if not is_on_floor():
		if velocity.y < 0:
			sprite.play("jump")
		else:
			sprite.play("fall")
	elif velocity.x != 0:
		sprite.play("run")
	else:
		sprite.play("idle")

	move_and_slide()
