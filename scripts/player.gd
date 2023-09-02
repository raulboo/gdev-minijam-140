extends CharacterBody2D

const SPEED = 100.0
var last_direction = "down"

func _physics_process(delta):

	var animation_string = ""

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	var direction = Vector2(direction_x, direction_y)

	if direction.length():
		var ang = round(rad_to_deg(direction.angle()))/90 as int
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
				last_direction="up"

		animation_string="run_"
		velocity = direction * SPEED
	else:
		animation_string="idle_"

		velocity.x = move_toward(velocity.x, 0, SPEED/2)
		velocity.y = move_toward(velocity.y, 0, SPEED/2)

	
	var view_size = get_viewport_rect().size
	position.x = clamp(position.x, 0+16, view_size.x-16)
	position.y = clamp(position.y, 0+16, view_size.y-16)

	$AnimatedSprite2D.play(animation_string+last_direction)

	move_and_slide()

