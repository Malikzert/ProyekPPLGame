extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
const MAX_AIR_JUMP = 1

var air_jumps = 0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_floor():
		air_jumps = 0
	# Handle jump.
	if Input.is_action_just_pressed("move_up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif air_jumps < MAX_AIR_JUMP:
			velocity.y = JUMP_VELOCITY
			air_jumps += 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
		elif direction > 0:
			$AnimatedSprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
