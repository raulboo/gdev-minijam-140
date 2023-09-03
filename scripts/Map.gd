extends Node2D


func _physics_process(delta):
	for drop in $/root/World/Entities.get_children():
		if drop.is_in_group("cleaner"):
			# Deleta cell
			$Grass.set_cell(0,(drop.position/16).floor(),1,Vector2i(0,0))
