extends Node2D

signal painted_tile


func _physics_process(delta):
	for drop in $/root/World/Entities.get_children():
		if drop.is_in_group("cleaner"):
			# Deleta cell
			var tile_pos = (drop.position/16).floor()
			if $Grass.get_cell_source_id(0, tile_pos) == 2:
				$Grass.set_cell(0, tile_pos,1,Vector2i(0,0))
				emit_signal("painted_tile")
