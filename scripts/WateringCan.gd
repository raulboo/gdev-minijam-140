extends Node2D


var distance = 10

func _ready():
	pass # Replace with function body.

func _process(delta):
	set_pos()
	
func set_pos():
	var parent_position = get_parent().global_position
	var mouse_position_relative_to_player = (get_global_mouse_position() -
											 parent_position).normalized()
	global_position = ((mouse_position_relative_to_player * distance) + 
																parent_position)
	if global_position.y < parent_position.y:
		$AnimatedSprite2D.z_index = 1
	else:
		$AnimatedSprite2D.z_index = 3
	
