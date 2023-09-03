extends Node2D

@export var Egg: PackedScene

func handle_bullet_spawned(position: Vector2, direction: Vector2):
	var bullet = Egg.instantiate()
	var bullet_rotation = direction.angle() + PI/2

	bullet.global_position = position
	bullet.set_direction(direction, bullet_rotation)
	get_parent().add_child(bullet)
