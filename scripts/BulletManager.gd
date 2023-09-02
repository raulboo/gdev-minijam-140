extends Node2D

func handle_bullet_spawned(bullet: Egg, position: Vector2, direction: String):
	var bullet_direction = Vector2.ZERO
	var bullet_rotation = 0
	match(direction):
		"right":
			bullet_direction = Vector2.RIGHT
			bullet_rotation = PI/2
		"down":
			bullet_direction = Vector2.DOWN
			bullet_rotation = PI
		"left":
			bullet_direction = Vector2.LEFT
			bullet_rotation = -PI/2
		"up":
			bullet_direction = Vector2.UP
			bullet_rotation = 0
	bullet.global_position = position
	bullet.set_direction(bullet_direction, bullet_rotation)
	add_child(bullet)
