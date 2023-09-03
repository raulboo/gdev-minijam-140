extends Node

@onready var steps_buffer = 0
	
func _on_map_painted_tile():
	$Paint.play()

func _on_score_manager_score_up(level):
	#$Score.play()
	pass

func _on_player_player_fired_bullet(position, direction):
	$Atirar.play()

func _on_player_player_steps():
	if steps_buffer >= 10:
		$Step.play()
		steps_buffer=0
	else:
		steps_buffer+=1
