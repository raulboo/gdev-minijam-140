extends CharacterBody2D

signal player_fired_bullet(bullet, position, direction)

@onready var attack_cooldown: Timer = $AttackCooldown

const SPEED = 100.0
var last_direction = "down"

func _physics_process(delta):

	var view_size = get_viewport_rect().size
	position.x = clamp(position.x, 0+16, view_size.x-16)
	position.y = clamp(position.y, 0+16, view_size.y-16)

	var movement_direction = move()
	animate(movement_direction)
	
#func _unhandled_input(event):
#	if event.is_action_released("shoot"):
#		shoot()
		
func _input(event):
	if event.is_action("shoot"):
		shoot()
		
func shoot():
	if attack_cooldown.is_stopped():
		emit_signal("player_fired_bullet", global_position, last_direction)
		attack_cooldown.start()
	else:
		pass

# Handles player movement and returns its direction vector
func move() -> Vector2:
	var movement_direction := Vector2.ZERO

	if Input.is_action_pressed("up"):
		movement_direction.y = -1
	if Input.is_action_pressed("down"):
		movement_direction.y = 1
	if Input.is_action_pressed("left"):
		movement_direction.x = -1
	if Input.is_action_pressed("right"):
		movement_direction.x = 1

	movement_direction = movement_direction.normalized()
	velocity = movement_direction * SPEED
	move_and_slide()	
	return movement_direction
	
# Handles player animation
func animate(movement_direction):
	var animation_string = ""

	if movement_direction.length():
		animation_string="run_"
		var ang = round(rad_to_deg(movement_direction.angle()))/90 as int
		match (ang):
			-1:
				last_direction="up"
			0:
				last_direction="right"
			1:
				last_direction="down"
			2:
				last_direction="left"
			_:
				last_direction="down"
	else:
		animation_string="idle_"

	$AnimatedSprite2D.play(animation_string+last_direction)
